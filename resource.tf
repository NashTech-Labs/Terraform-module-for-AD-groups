provider "azuread" {}
provider "azurerm" {
  features {}
}
 
data "azuread_user" "users" {
  count = length(var.members)
  mail = var.members[count.index]
}
 
resource "azuread_group" "group" {
  display_name     = var.group_of_group
  security_enabled = true
}
 
resource "azuread_group_member" "group_members" {
  count = length(var.members)
  group_object_id  = azuread_group.group.id
  member_object_id = data.azuread_user.users[count.index].id
}
 
