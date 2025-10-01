data "tfe_organization" "org" {
  provider = tfe
  name     = var.organization
}

data "tfe_project" "project" {
  provider     = tfe
  name         = var.project
  organization = data.tfe_organization.org.name
}

data "tfe_workspace" "project_workspace" {
  provider     = tfe
  name         = var.workspace
  organization = data.tfe_organization.org.name
}

data "tfe_variable_set" "variable_sets" {
  for_each     = toset(var.variable_sets)
  provider     = tfe
  organization = data.tfe_organization.org.name
  name         = each.value
}

resource "tfe_workspace_variable_set" "workspace_variables" {
  for_each = data.tfe_variable_set.variable_sets
  provider        = tfe
  workspace_id    = data.tfe_workspace.project_workspace.id
  variable_set_id = each.value.id
}