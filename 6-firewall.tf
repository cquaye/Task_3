#Allow for web traffic
resource "google_compute_firewall" "allow-http" {
  name       = var.http_name
  network    = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

 
  target_tags = [ "carlton" ]
  source_tags = [ "jump-box" ]
  
}

#Allow for rdp
resource "google_compute_firewall" "allow-rdp" {
  name        = var.rdp_name
  network     = google_compute_network.main.name

  allow {
    protocol    = "tcp"
    ports       = ["3389"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = [ "jump-box" ]
}
