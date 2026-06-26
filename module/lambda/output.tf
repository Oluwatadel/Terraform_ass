output "signup_function_arn"{
    value = aws_lambda_function.signup_function.arn
}

output "signup_function_name"{
    value = aws_lambda.function.signup_function.function_name
}

output "login_function_arn"{
    value = aws_lambda_function.login_function.arn
}

output "login_function_name"{
    value = aws_lambda.function.login_function.function_name
}