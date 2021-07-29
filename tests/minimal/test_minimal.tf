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

  name = "SIPG1"
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
