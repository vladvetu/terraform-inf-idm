provider "ovirt" {
  url = "${var.ovirt_url}"
  username  = "${var.ovirt_username}"
  password  = "${var.ovirt_password}"
}

provider "phpipam" {
  endpoint = var.phpipam_url
  app_id   = var.phpipam_app_id
  password = var.phpipam_password
  username = var.phpipam_username
  insecure = var.phpipam_insecure
}

# terraform {
#   backend "local" {
#     path = "ovirt_terraform.tfstate"
#   }
# }