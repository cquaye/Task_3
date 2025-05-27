resource "google_compute_subnetwork" "hqinternal" {
  name                     = "hqinternal"
  ip_cidr_range            = "10.69.10.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true

}



# Create proxy-only subnet
resource "google_compute_subnetwork" "proxy_only_subnet"{
  name                               = "proxy-subnet"
  ip_cidr_range                      = "10.100.0.0/24"
  region                             = "us-central1"
  network                            = google_compute_network.main.id
  purpose                            = "REGIONAL_MANAGED_PROXY"
  role                               = "ACTIVE"
  

}