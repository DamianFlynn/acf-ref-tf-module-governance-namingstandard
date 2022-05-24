variable "environment" {
  description = "Name of the Environment (e.g., D, Q, S, P)"
  default = "D"
  validation {
    condition     = contains(["D", "Q", "S", "P"], var.environment)
    error_message = "Environment must be 'D'ev, 'Q'A, 'S'tage or 'P'rod."
  } 
}

variable "workload" {
  description = "Name of the Workload"
  default = "we1test"
}

variable "purpose" {
  description = "Purpose for the resouce"
  default = "poc"
}
