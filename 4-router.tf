# ---- or iowa----

resource "google_compute_router" "iowa-router" {
  name                         = var.router_name
  region                       = var.region
  network                      = google_compute_network.main.id
}