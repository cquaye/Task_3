# https://developer.hashicorp.com/terraform/language/values/outputs
/*
output "mylb_static_ip_address" {
  description = "The static IP address of the load balancer."
  value       = google_compute_address.lb.address
}

# https://developer.hashicorp.com/terraform/language/functions/join
output "compute_zones" {
  description = "Comma-separated compute zones"
  # convert set into string delimited by commas (CSV) before output
  value       = join(", ", data.google_compute_zones.available.names)
}
*/


/*
output "instance_external_ip" {
  value       = {
    vm1 = "http://${google_compute_instance_template.test-template-1.network_interface[0].access_config[0].nat_ip}"
    vm2 = "http://${google_compute_instance.instance-test2.network_interface[0].access_config[0].nat_ip}"
    vm3 = "http://${google_compute_instance.instance-test3.network_interface[0].access_config[0].nat_ip}"

  }
  description = "The external IP address of the GCE instance."
}

*/

# Frontedn Static IP

output "lb_static_ip_address"{
  description = "The static IP address of the load balancer."
  value       = "http://${google_compute_address.lb-static-ip.address}"
}

# https://developer.hashicorp.com/terraform/language/functions/join

output "compute_zones" {
  description = "Comma-seprated compute zones"
  value       = join(",", data.google_compute_zones.available.names)
}