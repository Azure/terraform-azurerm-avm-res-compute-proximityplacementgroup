<!-- BEGIN_TF_DOCS -->
# Azure Proximity Placement Group Module

This module is used to create and manage Proximity Placement Groups in Azure. Proximity Placement Groups are used to minimize latency between compute resources by grouping them within a specific data center.

## Features

- Create a Proximity Placement Group to optimize compute latency.
- Easily integrate with virtual machines, scale sets, and availability sets to ensure low-latency communication.

## Usage

To use this module in your Terraform configuration, you'll need to provide values for the required variables.

### Example - Deploy a Proximity Placement Group

This example demonstrates how to create a Proximity Placement Group.

```terraform
module "proximity_placement_group" {
  source = "Azure/avm-res-compute-proximity-placement-group/azurerm"

  name                = "myProximityPlacementGroup"
  location            = "East US"
  resource_group_name = "myResourceGroup"

  allowed_vm_sizes = ["Standard_D2ds_v5"]
  zone             = "1"
}
```

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.9)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>= 3.116.0, < 5.0.0)

- <a name="requirement_modtm"></a> [modtm](#requirement\_modtm) (0.3.2)

- <a name="requirement_random"></a> [random](#requirement\_random) (~> 3.5)

## Resources

The following resources are used by this module:

- [azurerm_management_lock.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_lock) (resource)
- [azurerm_proximity_placement_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/proximity_placement_group) (resource)
- [modtm_telemetry.telemetry](https://registry.terraform.io/providers/Azure/modtm/0.3.2/docs/resources/telemetry) (resource)
- [random_uuid.telemetry](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/uuid) (resource)
- [azurerm_client_config.telemetry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) (data source)
- [modtm_module_source.telemetry](https://registry.terraform.io/providers/Azure/modtm/0.3.2/docs/data-sources/module_source) (data source)

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_location"></a> [location](#input\_location)

Description: The Azure location where the proximity placement group should exist.

Type: `string`

### <a name="input_name"></a> [name](#input\_name)

Description: The name of the proximity placement group.

Type: `string`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: The name of the resource group in which to create the proximity placement group.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_allowed_vm_sizes"></a> [allowed\_vm\_sizes](#input\_allowed\_vm\_sizes)

Description: (Optional) Specifies the supported sizes of virtual machines that can be created in the proximity placement group.

Type: `list(string)`

Default: `null`

### <a name="input_enable_telemetry"></a> [enable\_telemetry](#input\_enable\_telemetry)

Description: This variable controls whether or not telemetry is enabled for the module.  
For more information see https://aka.ms/avm/telemetryinfo.  
If it is set to false, then no telemetry will be collected.

Type: `bool`

Default: `true`

### <a name="input_lock"></a> [lock](#input\_lock)

Description: Controls the Resource Lock configuration for this resource. The following properties can be specified:

- `kind` - (Required) The type of lock. Possible values are `\"CanNotDelete\"` and `\"ReadOnly\"`.
- `name` - (Optional) The name of the lock. If not specified, a name will be generated based on the `kind` value. Changing this forces the creation of a new resource.

Type:

```hcl
object({
    kind = string
    name = optional(string, null)
  })
```

Default: `null`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: Map of tags to assign to the proximity placement group.

Type: `map(string)`

Default: `null`

### <a name="input_zone"></a> [zone](#input\_zone)

Description: (Required) Specifies the supported zone of the proximity placement group. Changing this forces a new resource to be created.

Type: `string`

Default: `"1"`

## Outputs

The following outputs are exported:

### <a name="output_location"></a> [location](#output\_location)

Description: The Azure deployment region.

### <a name="output_resource"></a> [resource](#output\_resource)

Description: This is the full output for the resource.

### <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name)

Description: The name of the resource group.

### <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id)

Description: This id of the resource.

## Modules

No modules.

<!-- markdownlint-disable-next-line MD041 -->
## Data Collection

The software may collect information about you and your use of the software and send it to Microsoft. Microsoft may use this information to provide services and improve our products and services. You may turn off the telemetry as described in the repository. There are also some features in the software that may enable you and Microsoft to collect data from users of your applications. If you use these features, you must comply with applicable law, including providing appropriate notices to users of your applications together with a copy of Microsoft’s privacy statement. Our privacy statement is located at <https://go.microsoft.com/fwlink/?LinkID=824704>. You can learn more about data collection and use in the help documentation and our privacy statement. Your use of the software operates as your consent to these practices.
<!-- END_TF_DOCS -->