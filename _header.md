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
