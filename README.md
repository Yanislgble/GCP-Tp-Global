# GCP-Tp-Global
TP du 12/02/2025 avec Quentin SWIECH

OBJECTIF
=========
Ce git a pour but de permettre le déploiement automatique d'une infrastructure cloud hébergeant un serveur web codé en go.

MODE OPERATOIRE
===============

Le dépoiement de l'infrastructure sera effectué par un trigger Cloud Build.
Le trigger cloud build se basera sur ce dépôt git.
Le trigger cloudlancera un script terraform.
Le script terraform utilisera packer pour génrérer l'instance VM hébergeant le serveur web.
Packer utilsira un script ansible comme provisioner pour configurer la serveur web basé sur l'OS ubuntu en dernière version disponible.


Schéma global de l'infrastructure :
![image](https://github.com/user-attachments/assets/1d960920-cf13-484f-bd31-a7abafce9340)

Le script terraform permettra uniquement le déploiement de l'infrastructure de gauche (dans le projet cloud-devops-example-prod) en vert sur le schéma précédent.

L'infrastrucuture du projet de droite (dans le projet cloud-devops-example-prod) en rouge sur le schéma précédent, a été faite à la main humaine.


TACHES REALISEES
================
- Fonctionnement du serveur web en mode daemon.
- Configuration du serveur web (OS Ubuntu latest version) par ansible
- Provisionnement de l'instance VM par packer
- Configuration du buckete GCS pour terraform. 


TACHES EN COURS DE REALISATION
==============================
- Utilisation d'un script Terraform pour le déploiement de l'infrastructure (en cours de test, problème dépendance entre les modules en cours de résolution).
- Utilisation de cloud build pour déclencher le déploiement de l'infrastructure (dépôt git connecté, trigger à configurer, fichier cloudbuild.yaml à créer)
- Configuration de ce git pour son utilisation par Cloud Build


TACHES NON REALISEES
====================
- Configuraiton du cloud DNS
- Configuration du Cloud Monitoring
- Configuration de l'Artefact Registry 
