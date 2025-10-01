output "organization" {
  value = data.tfe_organization.org
}

output "project" {
  value = data.tfe_project.project
}

output "workspace" {
  value = data.tfe_workspace.project_workspace
}

output "variable_sets" {
  value = tfe_workspace_variable_set.workspace_variables
}