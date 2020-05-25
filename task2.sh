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

#Terraform - create gke cluster
#cd $PWD/terraform/
terraform init
terraform plan -out create_gke_cluster
terraform apply "create_gke_cluster" 
#cd $PWD

#Creamos VM basada en Centos
