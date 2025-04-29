#!/bin/bash

## deploy.sh
## Reduces dependencies on your local machine to the bare minimum.
## Creates an EKS cluster through IaC in Terraform

source vars.sh

## Install terraform
echo -e "$(prefix)$YELLOW [Dependencies] Install Terraform.$ENDCOLOR"
sudo yum install -y yum-utils shadow-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

## Install helm
echo -e "$(prefix)$YELLOW [Dependencies] Install Helm.$ENDCOLOR"
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
source get_helm.sh

cd src/terraform/

## Initialize terraform
echo -e "$(prefix)$YELLOW [Terraform] Initializing the project.$ENDCOLOR"
terraform init -input=false
echo -e "$(prefix)$GREEN [Terraform] Project initialized.$ENDCOLOR\n"

## Deploy project
echo -e "$(prefix)$YELLOW [Terraform] Deploying the project.$ENDCOLOR"
echo -e "$(prefix)$CYAN INFO: ☕ Go grab a coffee while we'll wait for Terraform to deploy the project. It will take about 15 minutes.$ENDCOLOR\n"
terraform apply -input=false -auto-approve
echo -e "$(prefix)$GREEN [Terraform] ✅ Deployment completed.$ENDCOLOR"