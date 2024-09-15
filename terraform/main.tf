module "hetzner_dns" {
  source         = "./hetzner_dns"
  domain_name    = var.domain_name
  hetzner_token  = var.hetzner_token
}
