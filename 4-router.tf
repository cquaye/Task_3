# ---- or iowa----

resource "google_compute_router" "iowa-router" {
  name    = "iowa-router"
  region  = "us-central1"
  network = google_compute_network.main.id
}