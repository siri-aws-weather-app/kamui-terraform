output "parameter_name" {
    value = aws_ssm_parameter.main.name
}

output "parameter_value" {
    value = aws_ssm_parameter.main.value
}
