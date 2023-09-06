# Installation Guide

Ce projet est un mini projet pour déployer un site static grâce à Docker.
Il faut suivre les différentes étapes


## Cloner le Site à déployer 

`git clone https://github.com/diranetafen/static-website-example.git`

## Configurer le DockerFile 

    vim Dockerfile
Le contenu ressemblera à ceci 

    FROM ubuntu:18.04
    MAINTAINER armel_embolo (feavfeav@gmail.com)
    RUN apt-get update
    RUN apt-get install -y nginx
    EXPOSE 80
    ADD static-website-example/ /var/www/html/
    CMD ["nginx", "-g", "daemon off;"]

## Builder l'image du Dockerfile 
Nous avons choisi de définir le tag de l'image à **v1** et le nom **webapp**.

    docker build -t webapp:v1 .

## Créer un container qui se basera sur l'image webapp:v1

Une fois que nous avons notre image qui est disponible il faut créer un container qui va tourner cette image et nous permettre d'accéder au site static.
**-d** : permettra de détacher le processus du terminal
**-p** : permettra de définir le port externe et la liaison interne
**--name** : permet de définir le nom de notre container (ici c'est **webapp**)
et nous allons utiliser notre image **webapp:v1**

    docker run --name webapp -d -p 80:80 webapp:v1

## Verifier que le container est lancé

Pour vérifier que le container est encours d'exécution il faut qu'il soit visible dans la liste des containers encours.

    docker ps

## Accéder au site

Pour ce fait il suffit de visiter l'addresse publique de votre serveur au port 80.
si en local ca sera http://localhost:80
