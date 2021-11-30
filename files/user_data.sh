#!/usr/bin/env bash

yum update
yum install docker -y
usermod -aG docker ec2-user
systemctl enable docker
systemctl start docker

yum install git -y

cat << HEREDOC > /root/.ssh/id_rsa
-----BEGIN OPENSSH PRIVATE KEY-----
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
UHJvLmxvY2FsAQID
-----END OPENSSH PRIVATE KEY-----
HEREDOC

chmod 0400 /root/.ssh/id_rsa

mkdir -p /src/phonebook-app-back

cd /src/phonebook-app-back

ssh-keyscan github.com >> /root/.ssh/known_hosts
git clone git@github.com:Shamistanh/PhoneBook-Step.git

cd PhoneBook-Step-Back

docker build -t phone-book-back:v1.0.0
docker run -di --name phone-book-back -p 80:80 my-app:v1.0.0


mkdir -p /src/phonebook-app-front

cd /src/phonebook-app-front

ssh-keyscan github.com >> /root/.ssh/known_hosts
git clone git@github.com:Shamistanh/phoneBook-front.git

cd PhoneBook-Step-Front

docker build -t phone-book-front:v1.0.0
docker run -di --name phone-book-front -p 80:80 my-app:v1.0.0


