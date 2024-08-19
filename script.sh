#!/bin/bash

#1º Atualizar o sistema
sudo yum update -y 

#2º Instalar o NGINX
#OBS.: Optei por este por achar mais prático 
sudo yum install nginx -y

#3° Instalar o Git
#OBS.: Temos de garantir todas as conexões que iremos usar no projeto
sudo yum install git -y

#4º Iniciar o serviço do nginx
sudo systemctl start nginx.service
sudo systemctl enable nginx.service

#5º Clonar o repositório
git clone https://github.com/EctorYDMenezes/projeto3.git

#6º Remover arquivos base do Nginx
sudo rm -rf /usr/share/nginx/html/*

#7º Criar pasta
#Caso já exista não será prejudicial
sudo mkdir -p /usr/share/nginx/html

#8º Copiar arquivos da pasta oriunda do repositório para a pasta correta
sudo cp -r projeto3/* /usr/share/nginx/html/

#8º Reiniciar o sistema
sudo systemctl restart nginx.service
echo "Sistema reiniciado, por favor checar a página!"
