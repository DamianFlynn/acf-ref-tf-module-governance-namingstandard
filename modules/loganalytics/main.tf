locals {
  full_name = "${local.vmName}"
  resource_group_name = "${var.environment}-${var.workload}-${var.purpose}"
  default_tags = {
    Environment = var.environment
    Application = var.workload
    Purpose     = var.purpose
    Description = "Resource Terraformed for ${local.full_name}"
    Terraform   = "true"
  }

  suffixAvailabilitySet = "as"
  suffixLoadbalancer    = "lb"
  suffixASG             = "asg"
  suffixNSG             = "nsg"
  suffixNIC             = "nic00"
  suffixOSdisk          = "osdisk"
  suffixDatadisk        = "datadisk"
  suffixPublicIP        = "pip"
  namePrefix            = length(split("-", local.resource_group_name)) >= 3 ? "${local.resource_group_name}-${var.purpose}" : "${regexall("(.*-)", local.resource_group_name)[0]}${var.purpose}"
  vmName          = var.name == null ? local.namePrefix : var.name

  availabilitySetName = "${local.vmName}-${local.suffixAvailabilitySet}"
  lbName              = "${local.vmName}-{$local.suffixAvailabilitySet}"

  storageAccountPrefix = "${replace(local.vmName, "-", "")}diag"

  uniqueString             = resource.random_string.uniqueString.id
  vmDiagStorageAccountName = lower(substr(replace("${local.storageAccountPrefix}${local.uniqueString}", "-", ""), 0, 23))
}

resource "random_string" "uniqueString" {
  length  = 16
  special = false
}
