# Package the Lambda function code
data "archive_file" "login" {
  type        = "zip"
  source_file = "${path.module}/code/login/login.py"
  output_path = "${path.module}/zip/login.zip"
}

data "archive_file" "login" {
  type        = "zip"
  source_file = "${path.module}/code/signup/signup.py"
  output_path = "${path.module}/zip/signup.zip"
}