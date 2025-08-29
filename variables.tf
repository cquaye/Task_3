



# core variables

variable "project_id" {
    type    = string
    default = "dusty-class-6-5-carlton-quaye"
  
}

variable "region" {
    type    = string
    default = "us-central1"
  
}

variable "creds" {
    type    = string
    default = "dusty-class-6-5-carlton-quaye-02096ed33190.json"
  
}


# vpc variales

variable "vpc_name" {
    type    = string
    default = "main"
  
}

# proxy subnet variables
variable "proxy_name" {
    type    = string
    default = "proxy-only-subnet"
  
}


variable "proxy_cidr" {
    type    = string
    default = "10.100.0.0/24"
  
}

# subnet variables
variable "subnet_name" {
    type    = string
    default = "hqinternal"
  
}

variable "subnet_cidr" {
    type    = string
    default = "10.69.10.0/24"
  
}

# router variables

variable "router_name" {
    type    = string
    default = "iowa-router"
  
}


# nat variables
variable "nat_name" {
    type    = string
    default = "iowanat"
  
}

# firewall variables

variable "http_name" {
    type    = string
    default = "allow-http"
  
}

variable "rdp_name" {
    type    = string
    default = "allow-rdp"
  
}

# mig variables

variable "mig_name" {
    type    = string
    default = "linux-mig"
  
}

variable "base_instance_name" {
    type    = string
    default = "linux"
  
}


# instance temlate variables
variable "template_name" {
    type    = string
    default = "linux-backend"
  
}

variable "machine_type" {
    type    = string
    default = "n2-standard-2"
  
}

variable "linux_image" {
    type    = string
    default = "debian-cloud/debian-12"
  
}


# auto scaler variables

variable "scaler_name" {
    type    = string
    default = "my-autoscaler"
  
}


# backend variables

variable "backend_name" {
    type    = string
    default = "lb-backend-service"
  
}


# frontend variables

variable "url_map_name" {
    type    = string
    default = "lb-url-map"
  
}

variable "http_proxy_name" {
    type    = string
    default = "lb-http-proxy"
  
}

# windows server variables

variable "windows_name" {
    type   = string
    default = "windows-rdp"
  
}

variable "machine_type_win" {
    type    = string
    default = "n2-standard-4"
  
}

variable "windows_image" {
    type    = string
    default =  "windows-cloud/windows-2022"
  
}