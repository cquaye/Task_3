
# Template for the linux server
resource "google_compute_instance_template" "linux-template" {
  name                   = var.template_name
  machine_type           = var.machine_type
  region                 = var.region

  tags = [ "carlton" ]

  disk {
    source_image         = "debian-cloud/debian-12"
    auto_delete          = true
    disk_size_gb         = 100
    boot                 = true
  }

  network_interface {
    subnetwork           = google_compute_subnetwork.hqinternal.id
    network              = google_compute_network.main.id

    
    /*
    access_config {
      // Ephemeral public IP
    }
    */
    
  }

   metadata_startup_script = file("./startup1.sh")

}

