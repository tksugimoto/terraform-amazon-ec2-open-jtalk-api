resource "aws_key_pair" "deployer" {
  key_name_prefix = "${var.prefix}-"
  public_key      = "${file("${var.ssh_public_key_path}")}"
}

data "template_file" "user_data" {
  template = "${file("templates/user_data.tpl.sh")}"

  vars {
    ssh_port  = "${var.ssh_port}"
    http_port = "${var.http_port}"
  }
}

resource "aws_instance" "main" {
  subnet_id                   = "${aws_subnet.public.id}"
  associate_public_ip_address = true
  instance_type               = "${var.ec2_instance_type}"
  ami                         = "${var.ami_id}"

  key_name = "${aws_key_pair.deployer.key_name}"

  # 初回インスタンス生成時に実行される処理(sshの待ち受けポート変更) 
  user_data = "${data.template_file.user_data.rendered}"

  vpc_security_group_ids = [
    "${aws_security_group.allow_ssh.id}",
    "${aws_security_group.allow_all_outbound.id}",
    "${aws_security_group.allow_http_inbound.id}",
  ]

  tags {
    Name = "${var.prefix}-main"
  }
}
