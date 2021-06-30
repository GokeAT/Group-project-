variable "project_name" {}
variable "group_name" {}

## Azure config variables ##
variable location {
  default = "Central US"
}

## Resource group variables ##
variable resource_group_name {
  default = "groupproject-rg"
}

## AKS kubernetes cluster variables ##
variable cluster_name {
  default = "groupproject_cluster"
}

variable "agent_count" {
  default = 3
}

variable "dns_prefix" {
  default = "dns"
}

variable "admin_username" {
    default = "Cole"
}