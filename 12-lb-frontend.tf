# Create static IP
resource "google_compute_address" "lb-static-ip" {
  name = "lb-static-ip"
  region = "us-central1"
}


# Create url map
resource "google_compute_region_url_map" "lb-url-map" {
  name = "lb-url-map"
  default_service = google_compute_region_backend_service.lb-backend-service.self_link
}

# Create http proxy
resource "google_compute_region_target_http_proxy" "lb-http-proxy" {
  name    = "lb-http-proxy"
  url_map = google_compute_region_url_map.lb-url-map.self_link
}


# Create forwarding lb "Frontend"
resource "google_compute_forwarding_rule" "lb-forwarding" {
  name                  = "lb-forwarding-rule"
  target                = google_compute_region_target_http_proxy.lb-http-proxy.self_link
  port_range            = "80"
  ip_protocol           = "TCP"
  ip_address            = google_compute_address.lb-static-ip.address
  load_balancing_scheme = "EXTERNAL_MANAGED" # Current Gen LB (not classic)
  network               = google_compute_network.main.id

  # During the destroy process, we need to ensure LB is deleted first, before proxy-only subnet
  depends_on = [
    google_compute_subnetwork.hqinternal,
    google_compute_subnetwork.proxy_only_subnet 
  ]
  
}