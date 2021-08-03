output "dn" {
  value       = aci_rest.infraSpAccPortGrp.id
  description = "Distinguished name of `infraSpAccPortGrp` object."
}

output "name" {
  value       = aci_rest.infraSpAccPortGrp.content.name
  description = "Spine interface policy group name."
}
