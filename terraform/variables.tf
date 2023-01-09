variable "rgname" {
  description = "Variable Resource Group Name"
  default     = "github-actionmm1"
  type        = string
}
variable "location" {
  description = "Azure location"
  default     = "West US 2"
  type        = string
}
variable "sname" {
  description = "Azure Storage Account"
  type        = string
}
