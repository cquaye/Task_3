
# https://developer.hashicorp.com/terraform/language/values/outputs
# https://developer.hashicorp.com/terraform/language/functions/join


# Outputs

output "compute_zones" {
  description = "Comma-seprated compute zones"
  value       = join(",", data.google_compute_zones.available.names)
}

output "windwows-vm" {
  value       = google_compute_instance.windows-rdp.network_interface[0].network_ip
  
}

output "backend_subnet_cidr" {
  value      = google_compute_subnetwork.hqinternal.ip_cidr_range
  
}


