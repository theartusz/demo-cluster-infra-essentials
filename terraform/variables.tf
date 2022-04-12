variable "azure" {
  type = object({
    subscription_id              = string
    tenant_id                    = string
    dns_zone_name                = string
    location                     = string
    resource_group_name          = string
    acr_name                     = string
    public_ip_name               = string
    storage_account              = string
    storage_container_essentials = string
    storage_container_magnifik   = string
  })
}

variable "tags" {
  type = map(any)
}
