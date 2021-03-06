#!/bin/bash -ex
# for userdata
# http://stackoverflow.com/questions/12417630/is-there-an-ami-that-takes-ssh-on-port-443

perl -pi -e 's/^#?Port [0-9]+/Port ${ssh_port}/' /etc/ssh/sshd_config
service sshd restart || service ssh restart


yum update -y
yum install -y docker
service docker start

docker run -d -p ${http_port}:8080 u6kapps/open-jtalk-api
