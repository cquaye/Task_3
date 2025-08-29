

# Checking for all zones that are up/available. 
data "google_compute_zones" "available"{
  status                  = "UP"
}

# create manage instance group
resource "google_compute_region_instance_group_manager" "linux_mig" {
  name                     = var.mig_name

  base_instance_name       = var.base_instance_name
  region                   = var.region


  distribution_policy_zones = data.google_compute_zones.available.names



  version {
    instance_template      = google_compute_instance_template.linux-template.self_link
  }

  target_size = 3

  

  named_port {
    name = "web"
    port = 80
  }

  auto_healing_policies {
    health_check          = google_compute_region_health_check.healthcheck.id
    initial_delay_sec     = 300
  }
}

