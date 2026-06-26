module "api"{
    source = "./module/api"
    login_function_arn = module.lambda.login_functionsign
}

module  "cloudfront"{
    source = "./module/cloudfront"
    s3_domain_name = module.s3.s3_domain_name
}

module  "cognito"{
    source = "./module/cognito"
}

module  "dynamodb"{
    source = "./module/dynamodb"
    table_name = "m4ace_user_table"
}

module  "lambda"{
    source = "./module/lambda"
}

module  "network"{
    source = "./module/network"
}

module  "s3"{
    source = "./module/s3"
}