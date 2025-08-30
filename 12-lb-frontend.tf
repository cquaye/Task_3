
# Create url map
resource "google_compute_region_url_map" "lb-url-map" {
  name                  = var.url_map_name
  region                = var.region
  default_service       = google_compute_region_backend_service.lb-backend-service.self_link
}

# Create http proxy
resource "google_compute_region_target_http_proxy" "lb-http-proxy" {
  name                  = var.http_proxy_name
  region                = var.region
  url_map               = google_compute_region_url_map.lb-url-map.self_link
}


# Create forwarding lb "Frontend"
resource "google_compute_forwarding_rule" "lb-forwarding" {
  name                  = var.forwarding_name
  region                = var.region
  target                = google_compute_region_target_http_proxy.lb-http-proxy.id
  port_range            = "80"
  ip_protocol           = "TCP"
  load_balancing_scheme = "INTERNAL_MANAGED" # Current Gen LB (not classic)
  network               = google_compute_network.main.id
  subnetwork            = google_compute_subnetwork.hqinternal.id


  # During the destroy process, we need to ensure LB is deleted first, before proxy-only subnet
  depends_on = [
    google_compute_subnetwork.hqinternal,
    google_compute_subnetwork.proxy_only_subnet,
    google_compute_region_backend_service.lb-backend-service
  ]
  
}