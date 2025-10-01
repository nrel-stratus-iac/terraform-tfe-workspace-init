provider "tfe" {}

module "workspace" {
  source = "./../.."
  organization = "NREL"
  project = "aws-ops"
  workspace = "aws-mod-ec2"
  variable_sets = [
    "Example Variable Set",
  ]
}