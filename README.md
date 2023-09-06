# Installation Guide

Ce projet est un mini projet pour déployer un site static grâce à Docker.
Il faut suivre les différentes étapes


## Cloner le Site à déployer 

`git clone https://github.com/diranetafen/static-website-example.git`

Mais nous l'avons déja intégré dans le repository actuel.

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
Mais comme nous souhaitons le publier sur DockerHub il faut préfixer l'image par le nom d'utilisateur DockerHub (**feavfeav** qui est celui que j'utilises).

    docker build -t feavfeav/webapp:v1 .
    
Si vous aviez déjà créé l'image, vous pouvez changer le tag par la commande

    docker tag <id_image> <new_name_image>
    
## Publier la nouvelle  l'image feavfeav/webapp:v1

Pour publier il faut avoir les accès au compte qui sera la base et utiliser la commande :

    docker push feavfeav/webapp:v1
Si vous avez un soucis d'accès alors vous n'êtes pas connecté. Pour vous connecter il vous faudra utiliser la commande :

    docker login 
Puis pusher votre image à nouveau.
Et une fois pushé l'image se retrouve sur le compte dockerHub https://hub.docker.com/r/feavfeav/webapp/

## Créer un container qui se basera sur l'image webapp:v1

Une fois que nous avons notre image qui est disponible il faut créer un container qui va tourner cette image et nous permettre d'accéder au site static.
**-d** : permettra de détacher le processus du terminal
**-p** : permettra de définir le port externe et la liaison interne
**--name** : permet de définir le nom de notre container (ici c'est **webapp**)
et nous allons utiliser notre image **feavfeav/webapp:v1**

    docker run --name webapp -d -p 80:80 webapp:v1

## Verifier que le container est lancé

Pour vérifier que le container est encours d'exécution il faut qu'il soit visible dans la liste des containers encours.

    docker ps

## Accéder au site

Pour ce fait il suffit de visiter l'adresse publique de votre serveur au port 80.
si en local ca sera http://localhost:80
