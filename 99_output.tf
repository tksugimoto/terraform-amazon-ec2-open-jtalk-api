output "Server IP" {
  value = "${aws_instance.main.public_ip}"
}

output "Server SSH Port" {
  value = "${var.ssh_port}"
}
