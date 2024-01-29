variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  default     = ["us-west-1a", "us-west-1c"]
  type        = list(string)
}

