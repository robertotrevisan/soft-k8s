# soft-kubernetes

Front-End utilizado foi o Rancher (https://rancher.com/)

Infraestrutura utilizada na AmazonAWS através do AWS_CLI (commandLine e console):
    - EC2;
    - Route53
    - ELB

Kubernetes com ingress Traefik 2.4

Pipeline Jenkins (Rancher Pipeline)

Entregáveis:

01 - scripts utilizados no Deploy - aws-provisionamento (folder)

02 - Yml's conversitos - ymls-convertidos (folder)

03,04,05 - Jenkins Pipiline  - ver projeto (https://github.com/robertotrevisan/teste-infra)
        - arquivos - .rancher-pipeline.yml e deployment.yml

06 - Configuração:

    - provisionamento das maquinas EC2 através dos scripts
    - EC2 do Rancher roda um docker com os containers (traefik+LetsEncrypt, portainer e o próprio Rancher)
    - antes da Instalação dos Workers, capturar o token do Master Server e atualizar o script (scripts/k3s-node.sh)
    - importar o Master para o gerencimento do Rancher
    - o gerenciador de volumes utilizado foi o Longhorn (https://longhorn.io/)

URL de acessos:

console do Rancher 
https://rancher.soft.robertotrevisan.com.br/

testeInfra App 
https://testeinfra.clustersoft.robertotrevisan.com.br/
