# required AVM resources interfaces
resource "azurerm_management_lock" "this" {
  count = var.lock != null ? 1 : 0

  lock_level = var.lock.kind
  name       = coalesce(var.lock.name, "lock-${var.lock.kind}")
  scope      = azurerm_proximity_placement_group.this.id
  notes      = var.lock.kind == "CanNotDelete" ? "Cannot delete the resource or its child resources." : "Cannot delete or modify the resource or its child resources."
}

resource "azurerm_proximity_placement_group" "this" {
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
  allowed_vm_sizes    = var.allowed_vm_sizes
  tags                = var.tags
  zone                = var.zone
}
