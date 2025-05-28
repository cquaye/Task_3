# creating the auto scaling for the managed instance groups. 


resource "google_compute_region_autoscaler" "autoscale-test-1" {
  name   = "my-autoscaler"
  region   = "us-central1"
  target = google_compute_region_instance_group_manager.manageinstance1.id

  autoscaling_policy {
    max_replicas    = 6
    min_replicas    = 3
    cooldown_period = 60

    cpu_utilization {
      target = 0.5
    }
  }
}

