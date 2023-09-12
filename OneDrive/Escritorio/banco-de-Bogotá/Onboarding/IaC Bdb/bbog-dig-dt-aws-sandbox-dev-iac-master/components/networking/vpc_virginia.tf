module "vpc_virginia" {
  source = "github.com/bancodebogota/bbog-dig-aws-vpc-iac?ref=v14.0.0"

  providers = {
    aws = aws.virginia
  }

  create_vpc             = true
  name                   = var.product_prefix
  tags                   = var.tags
  cidr                   = var.vpc_cidr_virginia
  azs                    = var.vpc_azs_virginia
  private_subnets        = var.vpc_private_subnets_virginia
  public_subnets         = var.vpc_public_subnets_virginia
  enable_dns_hostnames   = true
  enable_nat_gateway     = var.enable_nat_gateway_virginia
  tgw_attachments        = var.tgw_attachments_virginia
  create_vpc_endpoint_s3 = var.create_vpc_endpoint_s3_virginia
  create_tpa             = var.create_vpc_endpoint_service_transit_proxy_attachment_virginia
  transit_proxy_services = var.vpc_transit_proxy_service_name_virginia
  create_vpc_endpoint    = true
  nat_gateways_count     = var.nat_gateways_count_virginia

  endpoints = [
    {
      service_name        = "com.amazonaws.us-east-1.execute-api"
      vpc_endpoint_type   = "Interface"
      private_dns_enabled = false

      security_group_ids = [
        module.security_group_vpc_endpoint_api.this_security_group_id
      ]
    }
  ]
}

module "security_group_vpc_endpoint_api" {
  source = "github.com/bancodebogota/bbog-dig-aws-security-group-iac?ref=v0.3.1"

  name        = "vpc-endpoint-execute-api"
  description = "Security group for private API endpoints"
  vpc_id      = module.vpc_virginia.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      description = "Ingress port for api end  point"
      cidr_blocks = module.vpc_virginia.vpc_cidr_block
    },
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "tcp"
      description = "Egress port for api end point"
      cidr_blocks = module.vpc_virginia.vpc_cidr_block
    },
  ]
}