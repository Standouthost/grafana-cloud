// locals.tf

locals {
  http_websites = [
    { job = "argocd.soh.re", target = "https://argocd.soh.re" },
    { job = "etherpad.soh.re", target = "https://etherpad.soh.re" },
    { job = "flights.soh.re", target = "https://flights.soh.re" },
    { job = "hey.soh.re", target = "https://hey.soh.re" },
    { job = "ip.jmainguy.com", target = "https://ip.jmainguy.com" },
    { job = "jmainguy.com", target = "https://jmainguy.com" },
    { job = "longhorn.soh.re", target = "https://longhorn.soh.re" },
    { job = "nextcloud.soh.re", target = "https://nextcloud.soh.re" },
    { job = "rightwaypropertycare.com", target = "https://rightwaypropertycare.com" },
    { job = "soh.re", target = "https://soh.re" },
    { job = "spam.soh.re", target = "https://spam.soh.re" },
    { job = "standouthost.com", target = "https://standouthost.com" },
    { job = "statuscode.soh.re", target = "https://statuscode.soh.re" },
    { job = "www.jmainguy.com", target = "https://www.jmainguy.com" },
    { job = "www.rightwaypropertycare.com", target = "https://www.rightwaypropertycare.com" },
    { job = "www.soh.re", target = "https://www.soh.re" },
    { job = "www.standouthost.com", target = "https://www.standouthost.com" },
    { job = "zot.soh.re", target = "https://zot.soh.re" }
  ]

  tcp_checks = [
    { job = "ns1.vpsaddict.com-53", target = "ns1.vpsaddict.com:53" },
    { job = "ns2.vpsaddict.com-53", target = "ns2.vpsaddict.com:53" },
    { job = "ns3.vpsaddict.com-53", target = "ns3.vpsaddict.com:53" },
    { job = "augustine.standouthost.com-3389", target = "augustine.standouthost.com:3389" }
  ]

  valid_status_codes = {
    "argocd.soh.re"               = [200]
    "etherpad.soh.re"             = [200]
    "flights.soh.re"              = [200]
    "hey.soh.re"                  = [200]
    "ip.jmainguy.com"             = [200]
    "jmainguy.com"                = [200]
    "longhorn.soh.re"             = [200, 403] // Allow 403 for longhorn.soh.re
    "nextcloud.soh.re"            = [200]
    "rightwaypropertycare.com"    = [200]
    "soh.re"                      = [200]
    "spam.soh.re"                 = [200, 404] // Allow 404 for spam.soh.re
    "standouthost.com"            = [200]
    "statuscode.soh.re"           = [200]
    "www.jmainguy.com"            = [200]
    "www.rightwaypropertycare.com"= [200]
    "www.soh.re"                  = [200]
    "www.standouthost.com"        = [200]
    "zot.soh.re"                  = [200]
  }
}
