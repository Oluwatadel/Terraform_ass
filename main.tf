module  "api"{
    source = "/module/api"
}

module  "cloudfront"{
    source = "/module/cloudfront"
    s3_domain_name = module.s3.s3_domain_name
}

module  "cognito"{
    source = "/module/cognito"
}

module  "dynamodb"{
    source = "/module/dynamodb"
}

module  "lambda"{
    source = "/module/lambda"
}

module  "network"{
    source = "/module/network"
}

module  "s3"{
    source = "/module/s3"
}