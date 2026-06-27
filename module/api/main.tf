resource "aws_api_gateway_rest_api" "api" {
  name = "m4ace-test"
  body = jsonencode({
    openapi = "3.0.1"
    info = {
      title   = "m4ace"
      version = "1.0"
    }
    paths = {
      "/signup" = {
        get = {
          x-amazon-apigateway-integration = {
            httpMethod           = "POST"
            payloadFormatVersion = "1.0"
            type                 = "HTTP_PROXY"
            uri                  = "arn:aws:apigateway:${var.aws_region}:lambda:path/2015-3-31/functions/${var.signup_function_arn}/invocations"
          }
        }
      }

      "/login" = {
        get = {
          x-amazon-apigateway-integration = {
            httpMethod           = "GET"
            payloadFormatVersion = "1.0"
            type                 = "HTTP_PROXY"
            uri                  = "arn:aws:apigateway:${var.aws_region}:lambda:path/2015-3-31/functions/${login_function_arn}/invocations"
          }
        }
      }
    }
  })


  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_deployment" "api_deployment" {
  rest_api_id = aws_api_gateway_rest_api.api.id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.example.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "api_stage" {
  deployment_id = aws_api_gateway_deployment.api_deployment.id
  rest_api_id   = aws_api_gateway_rest_api.api.id
  stage_name    = "dev"
}
