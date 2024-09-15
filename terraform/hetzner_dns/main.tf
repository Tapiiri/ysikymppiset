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

resource "hetznerdns_record" "web" {
  zone_id = data.hetznerdns_zone.dns_zone.id
  name    = "www"
  value   = "192.168.1.1" # replace with the correct IP address or use your data sources
  type    = "A"
  ttl     = 60
}

output "dns_record_id" {
  value = hetznerdns_record.web.id
}
