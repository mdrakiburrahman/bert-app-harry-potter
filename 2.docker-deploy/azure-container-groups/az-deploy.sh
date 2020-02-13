az login
az account set --subscription "Your--Subscription--Name"

docker tag dockerize-cdqa-ui-test yourazurecontainerregistry.azurecr.io/cdqa-ui
docker tag dockerize-cdqa-api-test yourazurecontainerregistry.azurecr.io/cdqa-api

az acr login --name YourAzureContainerRegistry

docker push yourazurecontainerregistry.azurecr.io/cdqa-ui
docker push yourazurecontainerregistry.azurecr.io/cdqa-api

az group deployment create --resource-group HP-POC-CDQA-Docker --template-file azuredeploy.json