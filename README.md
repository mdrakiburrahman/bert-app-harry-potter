# bert-app-harry-potter
A dockerized BERT-As-Service Q&amp;A application with Vue.js front end, trained on Harry Potter corpus

### Pre-requisite
A machine with the following tools installed:
- Docker
- Azure CLI
- Azure Subscription

### Steps to deploy from local VM (can be done with Azure DevOps as well)

1) Create an Azure Container Registry from the Azure Portal: [steps here](https://docs.microsoft.com/en-us/azure/container-registry/container-registry-get-started-portal)

2) Clone this Git Repo into the machine's local

3) Build the containers using the following docker commands (`cd` into the respective directories in `2.docker-deploy`):
`docker build -t dockerize-cdqa-ui-test .`
`docker build -t dockerize-cdqa-api-test .`

This will build the two containers `api` (BERT model API) and `UI` (Vue.js web app) on your local Docker Instance.

4) Run the following commands to push the containers to your Azure Container Registry (from **Step 1**), and deploy the Containers into a Container Group:
`az login`
`az account set --subscription "Your--Subscription--Name"`

`docker tag dockerize-cdqa-ui-test yourazurecontainerregistry.azurecr.io/cdqa-ui`
`docker tag dockerize-cdqa-api-test yourazurecontainerregistry.azurecr.io/cdqa-api`

`az acr login --name YourAzureContainerRegistry`

`docker push yourazurecontainerregistry.azurecr.io/cdqa-ui`
`docker push yourazurecontainerregistry.azurecr.io/cdqa-api`

`az group deployment create --resource-group HP-POC-CDQA-Docker --template-file azuredeploy.json`
