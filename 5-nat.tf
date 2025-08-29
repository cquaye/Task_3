resource "google_compute_router_nat" "iowanat" {
  name                               = var.nat_name
  router                             = google_compute_router.iowa-router.name
  region                             = var.region

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                             = google_compute_subnetwork.hqinternal.id
    source_ip_ranges_to_nat          = ["ALL_IP_RANGES"]
  }

  nat_ips                            = [google_compute_address.iowanat.self_link]
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address
resource "google_compute_address" "iowanat" {
  name                               = "iowanat"
  address_type                       = "EXTERNAL"
  network_tier                       = "PREMIUM"
  region                             = var.region
}