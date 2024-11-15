terraform {
  required_providers {
    grafana = {
      source = "grafana/grafana"
      version = "3.13.1"
    }
  }
}

provider "grafana" {
  url              = "https://sohre.grafana.net/"
  auth             = var.grafana_api_key
  sm_url           = "https://synthetic-monitoring-api.grafana.net"
  sm_access_token  = var.grafana_sm_api_key
}

variable "grafana_api_key" {}
variable "grafana_sm_api_key" {}


resource "grafana_synthetic_monitoring_check" "http_checks" {
   for_each = { for site in local.http_websites : site.job => site }

  job               = each.value.job
  alert_sensitivity = "high"
  target            = each.value.target
  enabled           = true
  probes            = [1]
  frequency         = 900000 # Frequency in milliseconds (15 minutes)
  labels            = {}
  settings {
    http {
      method              = "GET"
      fail_if_not_ssl     = true
      fail_if_ssl         = false
      ip_version          = "Any"
      no_follow_redirects = false
      valid_status_codes  = lookup(local.valid_status_codes, each.key, [200])
    }
  }
}

resource "grafana_synthetic_monitoring_check" "tcp_checks" {
  for_each = { for check in local.tcp_checks : check.job => check }

  job               = each.value.job
  alert_sensitivity = "high"
  target            = each.value.target
  enabled           = true
  probes            = [1]
  frequency         = 900000 # Frequency in milliseconds (15 minutes)
  labels            = {}
  settings {
    tcp {
      ip_version = "Any"
    }
  }
}
