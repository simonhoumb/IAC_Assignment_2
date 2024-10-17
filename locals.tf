locals {
  common_tags = {
    company     = "OperaTerraAS"
    project     = "oppg2"
    owner       = "simonhou"
    environment = "${terraform.workspace}"
  }
}
