variable "vpc_id_virginia" {
  type = string
}

variable "vpc_private_subnets_ids_virginia" {
  type = list(string)
}

variable "vpc_cidr_block_virginia" {
  type = string
}

variable "tag_log" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "log_group_retention_in_days" {
  type    = number
  default = 730
}

variable "api_obeltra_hello_world" {
  type = any
}