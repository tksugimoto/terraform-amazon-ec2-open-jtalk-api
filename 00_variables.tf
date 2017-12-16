# AWS APIキー変数設定
variable "aws_access_key" {
  description = "AWS アクセスキーID"
}

variable "aws_secret_key" {
  description = "AWS アクセスキーシークレット"
}

variable "ssh_public_key_path" {
  description = "SSH公開鍵ファイルのPath"
}

variable "prefix" {
  description = "各リソースの名前のPrefix"
  default     = "Test"
}

variable "aws_region" {
  description = "AWSリージョン"
  default     = "ap-northeast-1"
}

variable "ami_id" {
  description = "Amazon マシンイメージ（AMI）"

  # デフォルト：Amazon Linux
  default = "ami-da9e2cbc"
}

variable "ec2_instance_type" {
  description = "Amazon EC2 インスタンスタイプ"

  # デフォルト：無料枠対象のt2.micro
  default = "t2.micro"
}

variable "ssh_port" {
  description = "ssh用port番号"
  default     = 22
}
