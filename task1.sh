#!/bin/bash

#Variables
export PWD=`pwd`
export LOCATION='us-central1'
export TF_VAR_location=$LOCATION
export ZONE='us-central1-c'
export TF_VAR_zone=-$ZONE
export PROJECT=$GOOGLE_CLOUD_PROJECT
export TF_VAR_project=$PROJECT


#Get/set infor of my environment
gcloud config set compute/zone $ZONE

#Terraform - create gke cluster
#cd $PWD/terraform/
terraform init
terraform plan -out create_gke_cluster
terraform apply "create_gke_cluster"
#cd $PWD

gcloud container clusters get-credentials challenge-gke-cluster

# nginx ingress controller installation
cd ..
rm -rf kubernetes-ingress
git clone https://github.com/nginxinc/kubernetes-ingress/
cd kubernetes-ingress/deployments
git checkout v1.7.0
kubectl apply -f common/ns-and-sa.yaml
kubectl apply -f rbac/rbac.yaml

#Crearemos los recursos comunes (por default, estoy agregando todos los que la documentación nginx indica)
kubectl apply -f common/default-server-secret.yaml
kubectl apply -f common/nginx-config.yaml

kubectl apply -f deployment/nginx-ingress.yaml
#kubectl get pods --namespace=nginx-ingress

kubectl apply -f service/loadbalancer.yaml
#kubectl get svc nginx-ingress --namespace=nginx-ingress






#Destroy
#terraform destroy