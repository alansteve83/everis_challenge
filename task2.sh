#!/bin/bash

#Variables
export PWD=`pwd`
export LOCATION='us-central1'
export ZONE='us-central1-c'
export PROJECT=$GOOGLE_CLOUD_PROJECT

gcloud config set project $PROJECT
# Habilitamos Kubernetes Engine API
gcloud services enable container.googleapis.com


#Get/set infor of my environment
gcloud config set compute/zone $ZONE

#Creamos VM basada en Centos
export MACHINE_NAME='challenge-2'
gcloud beta compute --project=acs-project-278301 instances create $MACHINE_NAME --zone=us-central1-c --machine-type=n1-standard-1 --subnet=default --network-tier=PREMIUM --maintenance-policy=MIGRATE --service-account=everischallenge@acs-project-278301.iam.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --image=centos-6-v20200521 --image-project=centos-cloud --boot-disk-size=20GB --boot-disk-type=pd-standard --boot-disk-device-name=challenge-2 --reservation-affinity=any

#Validación de vm creada.
#gcloud beta compute ssh --zone $ZONE $MACHINE_NAME --project $PROJECT --quiet
cd jenkins/
#INSTALAMOS ANSIBLE EN NUESTRO SERVIDOR
sudo apt-get install ansible -y

#obtener IP para armar los hosts
gcloud compute instances describe $MACHINE_NAME | grep networkIP | awk '{ print $2 }' >> inventory/hosts

