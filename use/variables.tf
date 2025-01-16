variable "azure_location" {
  type    = string
  default = "westeurope"
}

variable "azure_subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "azure_tenant_id" {
  type        = string
  description = "Azure tenant ID"
}
