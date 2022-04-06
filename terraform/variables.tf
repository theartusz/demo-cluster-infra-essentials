variable "azure" {
  type = object({
    subscription_id     = string
    tenant_id           = string
    dns_zone_name       = string
    location            = string
    resource_group_name = string
    acr_name            = string
    public_ip_name      = string
  })
}

variable "tags" {
  type = map(any)
}
