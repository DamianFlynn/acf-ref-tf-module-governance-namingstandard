terraform {
  required_providers {

  }

  required_version = ">= 1.1.3"
}

# provider "azurerm" {
#   features {}  
#   # alias           = "p-mgt"
#   # subscription_id = var.MGT_SubscriptionId
# }




# ---------------------------------------------------------------------------------------------------------------------
# CREAT THE RESOURCE GROUP FOR THE LOG ANALYTICS CLUSTER
# ---------------------------------------------------------------------------------------------------------------------


module "log_analytics_name" {
  source                           = "./modules/loganalytics"

  environment = var.environment
  workload = var.workload
  purpose = var.purpose
}