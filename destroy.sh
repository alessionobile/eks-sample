#!/bin/bash

## destroy.sh
## Destroys an EKS cluster through IaC in Terraform

source vars.sh

cd src/terraform/

## Destroys the project
echo -e "$(prefix)$YELLOW [Terraform] Destroying the project.$ENDCOLOR"
echo -e "$(prefix)$CYAN INFO: ☕ Go grab (another) coffee while we'll wait for Terraform to deploy the project. It will take about 15 minutes.$ENDCOLOR\n"
terraform destroy -input=false -auto-approve
echo -e "$(prefix)$GREEN [Terraform] ✅ The project has been destroyed.$ENDCOLOR\n"