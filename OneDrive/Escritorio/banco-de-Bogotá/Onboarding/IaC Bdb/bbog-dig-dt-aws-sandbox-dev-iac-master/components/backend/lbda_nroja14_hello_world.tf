module "lbda_nroja14_hello_world" {
  source = "github.com/bancodebogota/bbog-dig-aws-lambda-iac?ref=v6"

  providers = {
    aws = aws.virginia
  }

  function_name      = "nroja14_hello_world_function"
  handler            = "index.handler"
  runtime            = "python3.9"
  memory_size        = 128
  timeout            = 300
  create_lambda      = true
  create_log_group   = true
  lambda_create_role = true
  vpc_id             = var.vpc_id_virginia
  subnet_ids         = var.vpc_private_subnets_ids_virginia

  lambda_custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/AWSXRayDaemonWriteAccess",
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
    "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
  ]

  security_group = {
    ingress = [
      {
        from_port   = 0
        to_port     = 65535
        protocol    = "tcp"
        description = "Lambdas private ingress port"
        cidr_blocks = [var.vpc_cidr_block_virginia]
      },
    ]

    egress = [
      {
        from_port   = 0
        to_port     = 65535
        protocol    = "tcp"
        description = "Lambdas private egress port with public access"
        cidr_blocks = ["0.0.0.0/0"]
      },
    ]
  }

  log_group_retention_in_days = var.log_group_retention_in_days

  tags = merge(
    { Access = var.tag_log },
    var.tags
  )
}