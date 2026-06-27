resource "aws_cognito_user_pool" "cognitp" {
  name = "m4ace_class"

  schema {
    name                     = "terraform"
    attribute_data_type      = "Boolean"
    mutable                  = false
    required                 = false
    developer_only_attribute = false
  }

  schema {
    name                     = "role"
    attribute_data_type      = "String"
    mutable                  = true
    required                 = true
    string_attribute_constraints {
        min_length = 4
        max_length = 200
    }
  }
    
    password_policy {
      minimum_length = 8
    }
}

# resource "aws_cognito_user" "example" {
#   user_pool_id = aws_cognito_user_pool.example.id
#   username     = "example"

#   desired_delivery_mediums = 

#   attributes = {
#     terraform      = true
#     foo            = "bar"
#     email          = "no-reply@hashicorp.com"
#     email_verified = true
#   }
# }