# Create health check

resource "google_compute_region_health_check" "lb-health-check" {
  name                = "lb-health-check"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 3

  http_health_check {
    request_path = "/index.html"
    port         = 80
  }
}


# Create backend service "backend"
resource "google_compute_region_backend_service" "lb-backend-service" {
  name          = "lb-backend-service"
  health_checks = [google_compute_region_health_check.lb-health-check.id]
  protocol              = "HTTP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  port_name             = "web"
  backend {
    group           = google_compute_region_instance_group_manager.manageinstance1.instance_group
    capacity_scaler = 1.0
    balancing_mode  = "UTILIZATION"
  }
}

