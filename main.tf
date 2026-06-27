locals {
  account_id = data.aws_caller_identity.current
  aws_region = data.aws_region.current
}
module "api" {
  source              = "./module/api"
  login_function_arn  = module.lambda.login_function_arn
  signup_function_arn = module.lambda.signup_function_arn
  aws_region          = local.aws_region
  LAMBDA_NAMES = [
    module.lambda.signup_function.function_name,
    module.lambda.login_function.function_name
  ]
}

module "cloudfront" {
  source         = "./module/cloudfront"
  s3_domain_name = module.s3.s3_domain_name
}

module "cognito" {
  source = "./module/cognito"
}

module "dynamodb" {
  source     = "./module/dynamodb"
  table_name = "m4ace_user_table"
}

module "lambda" {
  source = "./"
}

module "network" {
  source = "./module/network"
}

module "s3" {
  source = "./module/s3"
}
