variable "environment" {
  description = "Name of the Environment (e.g., D, Q, S, P)"
  default = "D"
  validation {
    condition     = contains(lower(["D", "Q", "S", "P"]), var.environment)
    error_message = "Environment must be 'D'ev, 'Q'A, 'S'tage or 'P'rod."
  } 
}

variable "workload" {
  description = "Name of the Workload"
}

variable "purpose" {
  description = "Purpose for the resouce"
}

variable "name" {
  description = "(optional) Overide the governance of the name"
  default = null
}

