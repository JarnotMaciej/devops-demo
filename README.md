# devops-demo

## requirements

```
python3.12-venv
az CLI
terraform
kubectl
helm
```

## python

```bash
cd flask-app
python3 -m venv .venv
. .venv/bin/activate
pip install -r requirements.txt
flask --app dummy-endpoint run
```

## docker

```bash
docker build --no-cache -t JarnotMaciej/dummy-endpoint .
docker run -it -p 5000:5000 JarnotMaciej/dummy-endpoint:latest
docker compose up -d --build --force-recreate
```

## azure cli

```bash
az login
az account list
az account set --subscription "<YOUR-SUBSCRIPTION-ID>"
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<YOUR-SUBSCRIPTION-ID>"

export ARM_CLIENT_ID="<APPID_VALUE>"
export ARM_CLIENT_SECRET="<PASSWORD_VALUE>"
export ARM_SUBSCRIPTION_ID="<SUBSCRIPTION_ID>"
export ARM_TENANT_ID="<TENANT_VALUE>"
```

## terraform

```bash
cd terraform
terraform init
terraform validate
terraform plan -var-file=".tfvars"
terraform apply -var-file=".tfvars"
terraform output -raw kubernetes_config > ~/.kube/aks-config
export KUBECONFIG=~/.kube/aks-config
# echo "KUBECONFIG=~/.kube/aks-config" >> ~/.bashrc
terraform destroy -var-file=".tfvars"
```

## kubectl && helm

```bash
kubectl get nodes
helm install demo-release ./chart
helm upgrade demo-release ./chart
watch -n 1 kubectl get service demo-service
```
