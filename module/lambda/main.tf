


# Lambda function
resource "aws_lambda_function" "login_function" {
  filename      = data.archive_file.login.output_path
  function_name = "login_function"
  role          = var.login_role_arn
  handler       = "login.handler" //very important, the name of your file and function
  code_sha256   = data.archive_file.login.output_base64sha256

  runtime = "python3.14"

  environment {
    variables = {
      ENVIRONMENT = "production"
      LOG_LEVEL   = "info"
      user_table = var.user_table
    }
  }

  tags = {
    Environment = "production"
    Application = "example"
  }
}

#signup function
resource "aws_lambda_function" "signup_function" {
  filename      = data.archive_file.signup.output_path
  function_name = "signup_function"
  role          = var.login_role_arn
  handler       = "signup.handler"
  code_sha256   = data.archive_file.signup.output_base64sha256

  runtime = "python3.14"

  environment {
    variables = {
      ENVIRONMENT = "production"
      LOG_LEVEL   = "info"
      user_table = var.user_table
    }
  }

  tags = {
    Environment = "production"
    Application = "example"
  }
}