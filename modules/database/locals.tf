locals {
  common_tags = {
    company     = "OperaTerraAS"
    project     = "oppg2"
    owner       = "simonhou"
    environment = terraform.workspace
  }
  naming_suffix_seperated     = "-${local.common_tags.owner}-${local.common_tags.project}-${local.common_tags.environment}"
  naming_suffix_not_seperated = "${local.common_tags.owner}${local.common_tags.project}${local.common_tags.environment}"
}
