variable "public_subnet_ids" {
    description = "List of public subnet IDs"
    type        = list(string)
}

variable "wp_subnet_ids" {
    description = "List of private subnet IDs"
    type        = list(string)
}
