# Output the public IP of the EC2 instance
output "ec2_public_ip" {
  value       = aws_instance.techshop_instance.public_ip
  description = "The public IP address of the TechShop EC2 instance."
}

output "private_key" {
  value = tls_private_key.deployer_key.private_key_pem
  sensitive = true
}