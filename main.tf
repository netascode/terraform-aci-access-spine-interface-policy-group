resource "aci_rest" "infraSpAccPortGrp" {
  dn         = "uni/infra/funcprof/spaccportgrp-${var.name}"
  class_name = "infraSpAccPortGrp"
  content = {
    name = var.name
  }
}

resource "aci_rest" "infraRsHIfPol" {
  dn         = "${aci_rest.infraSpAccPortGrp.id}/rshIfPol"
  class_name = "infraRsHIfPol"
  content = {
    tnFabricHIfPolName = var.link_level_policy
  }
}

resource "aci_rest" "infraRsCdpIfPol" {
  dn         = "${aci_rest.infraSpAccPortGrp.id}/rscdpIfPol"
  class_name = "infraRsCdpIfPol"
  content = {
    tnCdpIfPolName = var.cdp_policy
  }
}

resource "aci_rest" "infraRsAttEntP" {
  count      = var.aaep != "" ? 1 : 0
  dn         = "${aci_rest.infraSpAccPortGrp.id}/rsattEntP"
  class_name = "infraRsAttEntP"
  content = {
    tDn = "uni/infra/attentp-${var.aaep}"
  }
}
