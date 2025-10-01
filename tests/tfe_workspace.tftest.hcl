provider "tfe" {

}

run "execute" {
  command = plan

  module {
    source = "./tests/setup"
  }

  assert {
    condition     = length(module.workspace.variable_sets) > 0
    error_message = "Unexpected variable set length"
  }

}


run "expected_errors" {
  command = plan

  variables {
    organization = "NREL"
    project = "aws-clients"
    workspace = "aws-secret-test-project-DELETEME"
    variable_sets = []
  }

  expect_failures = [
    var.workspace,
  ]
}