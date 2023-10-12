#!/bin/bash

instance_ip=""
ssh_user=""

terraform init

terraform plan -var-file=variables.tfvars

terraform apply -var-file=variables.tfvars -auto-approve

# Récupérez les sorties de Terraform
instance_ip=$(terraform output -raw instance_ip)
ssh_user=$(terraform output -raw ssh_user)

cat << EOF > .env
INSTANCE_IP=$instance_ip
SSH_USER=$ssh_user
EOF

echo "Adresse IP de l'instance : $instance_ip"
echo "Utilisateur SSH : $ssh_user"
