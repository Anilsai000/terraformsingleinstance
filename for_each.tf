# # THIS THE ONE WAY THAT WE DONT USE "For_Each" i.e, There is the problem of Code Duplication
# # To Avoid This We Use the "Terraform-For_Each"
# resource "Instance" "vm1" {
#     name = "vm1"
#     type = "t2.micro"
#     zone = "us-east-1"
# }

# resource "Instance" "vm2" {
#     name = "vm2"
#     type = "t2.nano"
#     zone = "us-east-1"
# }

# resource "Instance" "vm3" {
#     name = "vm3"
#     type = "t2.small"
#     zone = "us-east-1"
# }

# # Now by using the "For_Each". There is NO Code Dupliaction Here
# resource "Instance" "vms" {
#   for_each = {
#     "vm1" = "t2.micro"
#     "vm2" = "t2.nano"
#     "vm3" = "t2.small"
#   }
#   name = "each.key"
#   machine_type = "each.value"
#   zone = "us-east-1a"
# }

# # Again we can improve the Above Code i.e, 
# resource "Instance" "vm" {
#     for_each = {
#         "vm1" = {vm_size = "t2.micro", zone = "us-east-1a"},
#         "vm2" = {vm_size = "t2.nano", zone = "us-east-1b"},
#         "vm3" = {vm_size = "t2.small", zone = "us-east-1c"}
#     }
#     name = each.key
#     machine_type = each.value.vm_size
#     zone = each.value.zone
# }

# # To Keep the code clean & have the ABility to Re-use Code for Different Resources i.e,
# Locals {
#     virtual_machines = {
#         "vm1" = {vm_size = "t2.micro", zone = "us-east-1a"},
#         "vm2" = {vm_size = "t2.nano", zone = "us-east-1b"},
#         "vm3" = {vm_size = "t2.small", zone = "us-east-1c"}
#     }
   
#    resource "Instance" "vm" {
#     for_each = Locals.virtual_machines
#     name = each.key
#     machine_type = each.value.vm_size
#     zone = each.value.zone
#    }
# }