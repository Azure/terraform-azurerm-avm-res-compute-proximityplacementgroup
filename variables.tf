variable "location" {
  type        = string
  description = "The Azure location where the proximity placement group should exist."
  nullable    = false
}

variable "name" {
  type        = string
  description = "The name of the proximity placement group."

  validation {
    condition     = can(regex("^[a-zA-Z0-9_.-]{3,80}$", var.name))
    error_message = "The name must be between 1 and 80 characters long and can only contain letters, numbers, underscores, periods, and dashes."
  }
  validation {
    error_message = "The name must start with a letter or a number"
    condition     = can(regex("^[a-zA-Z0-9]", var.name))
  }
  validation {
    error_message = "The name must end with a letter or a number"
    condition     = can(regex("[a-zA-Z0-9]$", var.name))
  }
}

# This is required for most resource modules
variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the proximity placement group."
  nullable    = false
}

variable "allowed_vm_sizes" {
  type        = list(string)
  default     = null
  description = "(Optional) Specifies the supported sizes of virtual machines that can be created in the proximity placement group."
}

variable "enable_telemetry" {
  type        = bool
  default     = true
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module.
For more information see https://aka.ms/avm/telemetryinfo.
If it is set to false, then no telemetry will be collected.
DESCRIPTION
}

variable "lock" {
  type = object({
    kind = string
    name = optional(string, null)
  })
  default     = null
  description = <<DESCRIPTION
Controls the Resource Lock configuration for this resource. The following properties can be specified:

- `kind` - (Required) The type of lock. Possible values are `\"CanNotDelete\"` and `\"ReadOnly\"`.
- `name` - (Optional) The name of the lock. If not specified, a name will be generated based on the `kind` value. Changing this forces the creation of a new resource.
DESCRIPTION

  validation {
    condition     = var.lock != null ? contains(["CanNotDelete", "ReadOnly"], var.lock.kind) : true
    error_message = "Lock kind must be either `\"CanNotDelete\"` or `\"ReadOnly\"`."
  }
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "Map of tags to assign to the proximity placement group."
}

variable "zone" {
  type        = string
  default     = "1"
  description = "(Required) Specifies the supported zone of the proximity placement group. Changing this forces a new resource to be created."
}
