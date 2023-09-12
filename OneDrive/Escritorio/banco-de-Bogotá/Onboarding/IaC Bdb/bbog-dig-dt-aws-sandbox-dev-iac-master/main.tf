locals {
  account_id     = data.aws_caller_identity.current.account_id
  product_prefix = "sbx"

  tags = {
    Team        = "sbx"
    Product     = "sandbox_account"
    Terraform   = true
    Environment = "dev"
  }
  # Networking
  vpc_cidr_virginia = "10.1.0.0/21"
  # vpc_azs_virginia                                              = ["us-east-1a", "us-east-1b", "us-east-1c"]
  # vpc_private_subnets_virginia                                  = ["10.1.20.0/24", "10.1.21.0/24", "10.1.22.0/24"]
  vpc_azs_virginia                                              = ["us-east-1a"]
  vpc_private_subnets_virginia                                  = ["10.1.4.0/24"]
  vpc_public_subnets_virginia                                   = ["10.1.0.0/24"]
  enable_nat_gateway_virginia                                   = false
  create_vpc_endpoint_s3_virginia                               = false
  nat_gateways_count_virginia                                   = 1
  create_vpc_endpoint_service_transit_proxy_attachment_virginia = true
  vpc_transit_proxy_service_name_virginia                       = []
  tgw_attachments_virginia                                      = []

  tag_log                     = "Green"
  log_group_retention_in_days = 7

  api_nroja14_hello_world = {
    stages = [{
      name = "test"
    }]
    # In order to know which account's subnets are each CIDR:
    cidrs = [
      # BdB's Public IPs
      "200.124.124.0/24", "200.124.125.0/24",
      # NROJA14's IP
      "127.0.0.1/32"
    ]
  }
}

data "aws_caller_identity" "current" {}

module "backend" {
  source = "./components/backend"

  tags                             = local.tags
  tag_log                          = local.tag_log
  vpc_id_virginia                  = module.networking.vpc_id_virginia
  vpc_private_subnets_ids_virginia = module.networking.vpc_private_subnets_ids_virginia
  vpc_cidr_block_virginia          = module.networking.vpc_cidr_block_virginia
  log_group_retention_in_days      = local.log_group_retention_in_days
  api_nroja14_hello_world          = local.api_nroja14_hello_world


}

module "networking" {
  source = "./components/networking"

  product_prefix                                                = local.product_prefix
  tags                                                          = local.tags
  vpc_cidr_virginia                                             = local.vpc_cidr_virginia
  vpc_azs_virginia                                              = local.vpc_azs_virginia
  vpc_private_subnets_virginia                                  = local.vpc_private_subnets_virginia
  vpc_public_subnets_virginia                                   = local.vpc_public_subnets_virginia
  enable_nat_gateway_virginia                                   = local.enable_nat_gateway_virginia
  create_vpc_endpoint_s3_virginia                               = local.create_vpc_endpoint_s3_virginia
  create_vpc_endpoint_service_transit_proxy_attachment_virginia = local.create_vpc_endpoint_service_transit_proxy_attachment_virginia
  vpc_transit_proxy_service_name_virginia                       = local.vpc_transit_proxy_service_name_virginia
  tgw_attachments_virginia                                      = local.tgw_attachments_virginia
  nat_gateways_count_virginia                                   = local.nat_gateways_count_virginia
}
