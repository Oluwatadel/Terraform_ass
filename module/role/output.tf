output "login_role_arn"{
    value = aws_iam_role.login_role_arn
}

output "signup_role_arn" {
  value       = aws_iam_role.signup_role.arn
}
