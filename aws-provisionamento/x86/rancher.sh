#!/bin/sh
#####	NOME:				rancher.sh
#####	VERSÃO:				1.0
#####	DESCRIÇÃO:			Cria uma insstancia EC2 de uma instancia do Rancher Server.
#####	DATA DA CRIAÇÃO:	13/06/2021
#####	ESCRITO POR:		Roberto P. Trevisan
#####	E-MAIL:				trevisan@gmail.com
#####	DISTRO:				Debian GNU/Linux
#####	LICENÇA:			GPLv3
#####	PROJETO:			https://github.com/robertotrevisan/soft-kubernetes.git

##### Variaveis
INSTANCE_NUMER="1"
INSTANCE_TYPE="t3.medium"
AWS_CLI_PROFILE="awstrevisan"
AWS_PEM="id_trevisan"
AWS_SECURITY_GROUP="sg-xxxx" ## Substituir por uma válida
AWS_SUBNET="subnet-xxx"      ## Substituir por uma válida

##### CREATE RANCHER SERVER
echo "Criando Ranher Server..."
aws ec2 run-instances \
    --profile $AWS_CLI_PROFILE \
    --image-id ami-0dba2cb6798deb6d8 \
    --count $INSTANCE_NUMER \
    --instance-type $INSTANCE_TYPE \
    --key-name $AWS_PEM \
    --security-group-ids $AWS_SECURITY_GROUP \
    --subnet-id $AWS_SUBNET \
    --ebs-optimized \
    --block-device-mapping "[ { \"DeviceName\": \"/dev/sda1\", \"Ebs\": { \"VolumeSize\": 30 } } ]"
    --user-data file://scripts/rancher.sh \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=rancherserver}]' 'ResourceType=volume,Tags=[{Key=Name,Value=rancherserver}]' 