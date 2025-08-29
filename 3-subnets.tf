resource "google_compute_subnetwork" "hqinternal" {
  name                     = var.subnet_name
  ip_cidr_range            = var.subnet_cidr
  region                   =  var.region
  network                  = google_compute_network.main.id
  private_ip_google_access = true

}



# Create proxy-only subnet

resource "google_compute_subnetwork" "proxy_only_subnet"{
  name                               = var.proxy_name
  ip_cidr_range                      = var.proxy_cidr
  region                             = var.region
  network                            = google_compute_network.main.id
  #purpose                            = "REGIONAL_MANAGED_PROXY"
  purpose                            = "INTERNAL_HTTPS_LOAD_BALANCER"
  role                               = "ACTIVE"

}
