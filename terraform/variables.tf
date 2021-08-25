variable "namespace" {
  description = "The project namespace to use for unique resource naming"
  type        = string
}
variable "location" {
  description = "Azure location"
  default     = "East US"
  type        = string
}
variable "rgname" {
  description = "Resource Group Name"
  default     = "github-action"
  type        = string
}