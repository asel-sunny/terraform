output "main_instance_public_ip" {
    value = aws_instance.main[*].public_ip  # first_label.second_label.attribute, Reference to resource
    description = "This prints the public ip of main instance"
}

# output "main_instance_public_ip_2" {
#     value = aws_instance.main[1].public_ip  # first_label.second_label.attribute, Reference to resource
#     description = "This prints the public ip of main instance"
# }

# output "main_instance_public_ip_3" {
#     value = aws_instance.main[2].public_ip  # first_label.second_label.attribute, Reference to resource
#     description = "This prints the public ip of main instance"
# }