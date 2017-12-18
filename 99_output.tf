output "Server IP" {
  value = "${aws_instance.main.public_ip}"
}

output "Server SSH Port" {
  value = "${var.ssh_port}"
}

output "Open JTalk Web API URL (Sample)" {
  value = "http://${aws_instance.main.public_ip}:${var.http_port}/voice?text=こんにちは"
}
