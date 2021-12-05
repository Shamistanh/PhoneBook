#!/usr/bin/env bash

yum update
yum install docker -y
usermod -aG docker ec2-user
systemctl enable docker
systemctl start docker

yum install git -y

cat << HEREDOC > /root/.ssh/id_rsa
-----BEGIN OPENSSH PRIVATE KEY-----

-----END OPENSSH PRIVATE KEY-----
HEREDOC

chmod 0400 /root/.ssh/id_rsa

mkdir -p /src/phonebook-app-back

cd /src/phonebook-app-back

ssh-keyscan github.com >> /root/.ssh/known_hosts
git clone git@github.com:Shamistanh/PhoneBook-Step.git

cd PhoneBook-Step-Back

docker build -t phone-book-back:v1.0.0
docker run -di --name phone-book-back -p 80:80 phone-book-app-back:v1.0.0 -e DB_URL = ${db_url} -e DB_USERNAME = ${db_username}
-e DB_PASSWORD = ${db_password}


mkdir -p /src/phonebook-app-front

cd /src/phonebook-app-front

ssh-keyscan github.com >> /root/.ssh/known_hosts
git clone git@github.com:Shamistanh/phoneBook-front.git

cd PhoneBook-Step-Front

docker build -t phone-book-front:v1.0.0
docker run -di --name phone-book-front -p 80:80 phone-book-app-front:v1.0.0 -e BACKEND_URL = ${backend_url}


