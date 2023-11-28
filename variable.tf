variable "group_of_group" {
  description = "Name of the Azure AD group to create"
  type        = string
  default     = ""
}
 
variable "members" {
  description = "List of users to add to the Azure AD group"
  type        = list(string)
  default     = []
}
 
