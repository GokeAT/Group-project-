variable "project_name" {}
variable "group_name" {}

## Azure config variables ##
variable location {
  default = "UK West"
}

## Resource group variables ##
variable resource_group_name {
  default = "groupproject_rg"
}

## AKS kubernetes cluster variables ##
variable cluster_name {
  default = "groupproject_cluster"
}

variable "agent_count" {
  default = 1
}

variable "dns_prefix" {
  default = "dns"
}

variable "admin_username" {
    default = "Cole"
}