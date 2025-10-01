variable "organization" {
  description = "The TFC organization in which to create the workspace. Default is NREL"
  type        = string
  default     = "NREL"
}

variable "project" {
  description = "The project in the TFC organization to associate with the workspace. Default is aws-clients"
  type        = string
  default     = "aws-clients"
}

variable "workspace" {
  description = (
    "The name of the workspace. Should match the convetion \"{provider}-{data_class}-{org}\", e.g. aws-low-mhkdr"
  )
  type = string
  validation {
    condition     = can(regex("^(?P<provider>[^-]+)-(?P<dataclass>(?:low|mod))-(?P<org>[a-zA-Z0-9_-]+)$", var.workspace))
    error_message = "Workspace name must match <provider>-<data_class>-<org> format."
  }
}

variable "variable_sets" {
  description = "Names of variable sets to attach to the workspace."
  type        = list(string)
  default     = []
}