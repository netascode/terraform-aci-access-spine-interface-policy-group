terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aci = {
      source  = "netascode/aci"
      version = ">=0.2.0"
    }
  }
}

module "main" {
  source = "../.."

  name              = "SIPG1"
  link_level_policy = "100G"
  cdp_policy        = "CDP-ON"
  aaep              = "AAEP1"
}

data "aci_rest" "infraSpAccPortGrp" {
  dn = "uni/infra/funcprof/spaccportgrp-${module.main.name}"

  depends_on = [module.main]
}

resource "test_assertions" "infraSpAccPortGrp" {
  component = "infraSpAccPortGrp"

  equal "name" {
    description = "name"
    got         = data.aci_rest.infraSpAccPortGrp.content.name
    want        = module.main.name
  }
}

data "aci_rest" "infraRsHIfPol" {
  dn = "${data.aci_rest.infraSpAccPortGrp.id}/rshIfPol"

  depends_on = [module.main]
}

resource "test_assertions" "infraRsHIfPol" {
  component = "infraRsHIfPol"

  equal "tnFabricHIfPolName" {
    description = "tnFabricHIfPolName"
    got         = data.aci_rest.infraRsHIfPol.content.tnFabricHIfPolName
    want        = "100G"
  }
}

data "aci_rest" "infraRsCdpIfPol" {
  dn = "${data.aci_rest.infraSpAccPortGrp.id}/rscdpIfPol"

  depends_on = [module.main]
}

resource "test_assertions" "infraRsCdpIfPol" {
  component = "infraRsCdpIfPol"

  equal "tnCdpIfPolName" {
    description = "tnCdpIfPolName"
    got         = data.aci_rest.infraRsCdpIfPol.content.tnCdpIfPolName
    want        = "CDP-ON"
  }
}

data "aci_rest" "infraRsAttEntP" {
  dn = "${data.aci_rest.infraSpAccPortGrp.id}/rsattEntP"

  depends_on = [module.main]
}

resource "test_assertions" "infraRsAttEntP" {
  component = "infraRsAttEntP"

  equal "tDn" {
    description = "tDn"
    got         = data.aci_rest.infraRsAttEntP.content.tDn
    want        = "uni/infra/attentp-AAEP1"
  }
}
