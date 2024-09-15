terraform {
  required_providers {
    hetznerdns = {
      source = "timohirt/hetznerdns"
      version = "2.2.0"
    }
  }
}

provider "hetznerdns" {
  apitoken = var.hetzner_token
  
}

data "hetznerdns_zone" "dns_zone" {
  name = var.domain_name
}

# Read the DNS records from the JSON file using the provided path
locals {
  dns_records = jsondecode(file(var.dns_records_file))
}

# Dynamically create DNS records using the JSON data
resource "hetznerdns_record" "web" {
  for_each = { for record in local.dns_records : record.name => record }

  zone_id = data.hetznerdns_zone.dns_zone.id
  name    = each.value.name
  value   = each.value.value
  type    = each.value.type
  ttl     = each.value.ttl
}

output "dns_record_ids" {
  value = [for r in hetznerdns_record.web : r.id]
}
