locals {
  common_tags = {
    company     = "OperaTerraAS"
    project     = "oppg2"
    owner       = "simonhou"
    backend     = "backend"
    environment = terraform.workspace
  }
  naming_suffix_backend_seperated     = "-${local.common_tags.owner}-${local.common_tags.backend}"
  naming_suffix_backend_not_seperated = "${local.common_tags.owner}${local.common_tags.backend}"
}
