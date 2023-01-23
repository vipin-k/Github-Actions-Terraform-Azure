variable "rgname" {
  description = "Resource Group Name"
  default     = "github-action"
  type        = string
}
variable "location" {
  description = "Azure locations"
  default     = "East US"
  type        = string
}
variable "sname" {
  description = "Azure Storage Account"
  type        = string
}
variable "password" {
  description = "Azure  password"
  type        = string
}

