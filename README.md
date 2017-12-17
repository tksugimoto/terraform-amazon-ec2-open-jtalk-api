# terraform-amazon-ec2-open-jtalk-api
[Open JTalk](http://open-jtalk.sourceforge.net/) Web API を Amazon EC2 上に構築する [Terraform](https://www.terraform.io/) 設定コード

Open JTalk Web API は [u6k/open_jtalk-docker](https://github.com/u6k/open_jtalk-docker) を使用

## 使用方法
1. [Terraform](https://www.terraform.io/) をインストール
1. このリポジトリをclone
1. Terraform 初期設定
    ```
    terraform init
    ```
1. 構築用設定
    1. 設定ファイルの雛形 [terraform.tfvars.sample](./terraform.tfvars.sample) ファイルを `terraform.tfvars` という名前でコピー
        ```
        cp terraform.tfvars.sample terraform.tfvars
        ```
    1. 設定ファイル `terraform.tfvars` に設定を書き込む
        * AWSアクセスキー・シークレットキー
        * SSHログイン用公開鍵のpath
        * AWSリソース名のPrefix
        * など（詳細は [00_variables.tf](./00_variables.tf) 参照）
1. 構築
    ```
    terraform apply
    ```
