<!-- BEGIN_TF_DOCS -->
[![Tests](https://github.com/netascode/terraform-aci-access-spine-interface-policy-group/actions/workflows/test.yml/badge.svg)](https://github.com/netascode/terraform-aci-access-spine-interface-policy-group/actions/workflows/test.yml)

# Terraform ACI Access Spine Interface Policy Group Module

Manages ACI Access Spine Interface Policy Group

Location in GUI:
`Fabric` » `Access Policies` » `Interfaces` » `Spine Interfaces` » `Policy Groups`

## Examples

```hcl
module "aci_access_spine_interface_policy_group" {
  source = "netascode/access-spine-interface-policy-group/aci"

  name              = "IPN"
  link_level_policy = "100G"
  cdp_policy        = "CDP-ON"
  aaep              = "AAEP1"
}

```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aci"></a> [aci](#requirement\_aci) | >= 0.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aci"></a> [aci](#provider\_aci) | >= 0.2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Spine interface policy group name. | `string` | n/a | yes |
| <a name="input_link_level_policy"></a> [link\_level\_policy](#input\_link\_level\_policy) | Link level policy name. | `string` | `""` | no |
| <a name="input_cdp_policy"></a> [cdp\_policy](#input\_cdp\_policy) | CDP policy name. | `string` | `""` | no |
| <a name="input_aaep"></a> [aaep](#input\_aaep) | Attachable access entity profile name. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dn"></a> [dn](#output\_dn) | Distinguished name of `infraSpAccPortGrp` object |
| <a name="output_name"></a> [name](#output\_name) | Spine interface policy group name |

## Resources

| Name | Type |
|------|------|
| [aci_rest.infraRsAttEntP](https://registry.terraform.io/providers/netascode/aci/latest/docs/resources/rest) | resource |
| [aci_rest.infraRsCdpIfPol](https://registry.terraform.io/providers/netascode/aci/latest/docs/resources/rest) | resource |
| [aci_rest.infraRsHIfPol](https://registry.terraform.io/providers/netascode/aci/latest/docs/resources/rest) | resource |
| [aci_rest.infraSpAccPortGrp](https://registry.terraform.io/providers/netascode/aci/latest/docs/resources/rest) | resource |
<!-- END_TF_DOCS -->