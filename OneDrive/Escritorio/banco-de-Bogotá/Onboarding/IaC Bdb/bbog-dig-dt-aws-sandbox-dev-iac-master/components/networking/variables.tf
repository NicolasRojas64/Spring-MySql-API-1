variable "product_prefix" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "vpc_cidr_virginia" {
  type = string
}

variable "vpc_azs_virginia" {
  type    = list(string)
  default = []
}

variable "vpc_private_subnets_virginia" {
  type    = list(string)
  default = []
}

variable "vpc_public_subnets_virginia" {
  type    = list(string)
  default = []
}

variable "create_vpc_endpoint_s3_virginia" {
  type    = bool
  default = false
}

variable "create_vpc_endpoint_service_transit_proxy_attachment_virginia" {
  type    = bool
  default = false
}

variable "vpc_transit_proxy_service_name_virginia" {
  default = []
  type = list(object({
    sg_ingress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
      description = string
    }))
    sg_egress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
      description = string
    }))
    name = string
  }))
}

variable "tgw_attachments_virginia" {
  type    = any
  default = []
}

variable "enable_nat_gateway_virginia" {
  type    = bool
  default = false
}

variable "nat_gateways_count_virginia" {
  type        = number
  default     = 1
  description = "description"
}