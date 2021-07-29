module "aci_access_spine_interface_policy_group" {
  source = "netascode/access-spine-interface-policy-group/aci"

  name              = "IPN"
  link_level_policy = "100G"
  cdp_policy        = "CDP-ON"
  aaep              = "AAEP1"
}
