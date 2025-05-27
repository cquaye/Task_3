

resource "google_compute_instance_template" "test-template-1" {
  name         = "test-template-1"
  machine_type = "n2-standard-2"

  disk {
    source_image = "debian-cloud/debian-12"
    auto_delete  = true
    disk_size_gb = 100
    boot         = true
  }

  network_interface {
    subnetwork = google_compute_subnetwork.hqinternal.name

    access_config {
      // Ephemeral public IP
    }
  }

   metadata_startup_script = file("./startup1.sh")

}









/*
resource "google_compute_instance_from_template" "test-template-1" {
  name = "instance-from-test-template-1"
  zone = "us-central1-a"

  source_instance_template = google_compute_instance_template.test-template-1.self_link_unique

  // Override fields from instance template
  can_ip_forward = false
  labels = {
    my_key = "my_value"
  }
}
*/