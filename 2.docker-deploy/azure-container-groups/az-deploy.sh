az login
az account set --subscription "Predictive Analytics POC"

docker tag dockerize-cdqa-ui-test huskyazurecontainerregistry.azurecr.io/cdqa-ui
docker tag dockerize-cdqa-api-test huskyazurecontainerregistry.azurecr.io/cdqa-api

az acr login --name HuskyAzureContainerRegistry

docker push huskyazurecontainerregistry.azurecr.io/cdqa-ui
docker push huskyazurecontainerregistry.azurecr.io/cdqa-api

az group deployment create --resource-group HSE-POC-CDQA-Docker --template-file azuredeploy.json