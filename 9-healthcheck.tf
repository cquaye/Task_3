
#create health check


resource "google_compute_region_health_check" "healthcheck" {
  name                = "healthcheck"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 10 # 50 seconds

  http_health_check {
    request_path = "/healthz"
    port         = "80"
  }
}
