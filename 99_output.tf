output "Server IP" {
  value = "${aws_instance.main.public_ip}"
}
