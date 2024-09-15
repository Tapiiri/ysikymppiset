terraform { 
  cloud { 
    
    organization = "ysikymppiset" 

    workspaces { 
      name = "Ysikymppiset" 
    } 
  } 
}

module "hetzner_dns" {
  source         = "./hetzner_dns"
  domain_name    = var.domain_name
  hetzner_token  = var.hetzner_token
  dns_records_file = var.dns_records_file
}
