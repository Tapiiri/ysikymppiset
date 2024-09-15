variable "domain_name" {
  description = "The domain name to manage DNS records for."
  type        = string
}

variable "hetzner_token" {
  description = "Hetzner API token"
  type        = string
  sensitive   = true
}

variable "dns_records_file" {
  description = "Path to the DNS records JSON file."
  type        = string
}
