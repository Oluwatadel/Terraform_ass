resource "aws_iam_role" "login_role_arn" {
  name               = "login_execution_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}
