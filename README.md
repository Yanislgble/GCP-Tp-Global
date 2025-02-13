# GCP-Tp-Global
TP du 12/02/2025 avec Quentin SWIECH

Ce git a pour but de permettre le déploiement automatique d'une infrastructure cloud hébergeant un serveur web codé en go.

Le dépoiement de l'infrastructure sera effectué par un trigger Cloud Build.
Le trigger lancera un script terraform.
Le script terraform utilisera packer pour génrérer l'instace VM.
Packer utilsira un script ansible comme provisioner pour configurer la serveur web basé sur l'OS ubuntu en dernière version disponible.


Schéma global de l'infrastructure :
![image](https://github.com/user-attachments/assets/1d960920-cf13-484f-bd31-a7abafce9340)

Le script terraform permettra uniquement le déploiement de l'infrastructure dans le projet cloud-devops-example-prod (en vert sur le schéma précédent).
