# bert-app-harry-potter

This Git repo is to supplement this article writeup for the app: [here](https://www.linkedin.com/pulse/building-intelligent-harry-potter-search-engine-bert-azure-rahman/)

A dockerized BERT-As-Service Q&amp;A application with Vue.js front end, trained on Harry Potter corpus

### Pre-requisite
A machine with the following tools installed:
- Docker
- Azure CLI
- Azure Subscription

### Steps to deploy from local VM (can be done with Azure DevOps as well)

**Step 1.** Create an Azure Container Registry from the Azure Portal: [steps here](https://docs.microsoft.com/en-us/azure/container-registry/container-registry-get-started-portal)

**Step 2.** Clone this Git Repo into the machine's local

**Step 3.** Build the containers using the following docker commands (`cd` into the respective directories in `2.docker-deploy`):
`docker build -t dockerize-cdqa-ui-test .` <br>
`docker build -t dockerize-cdqa-api-test .` <br>

This will build the two containers `api` (BERT model API) and `UI` (Vue.js web app) on your local Docker Instance.

**Step 4.** Run the following commands to push the containers to your Azure Container Registry (from **Step 1**), and deploy the Containers into a Container Group:
`az login` <br>
`az account set --subscription "Your--Subscription--Name"` <br><br>

`docker tag dockerize-cdqa-ui-test yourazurecontainerregistry.azurecr.io/cdqa-ui` <br>
`docker tag dockerize-cdqa-api-test yourazurecontainerregistry.azurecr.io/cdqa-api` <br>

`az acr login --name YourAzureContainerRegistry` <br><br>

`docker push yourazurecontainerregistry.azurecr.io/cdqa-ui`<br>
`docker push yourazurecontainerregistry.azurecr.io/cdqa-api`<br><br>

`az group deployment create --resource-group HP-POC-CDQA-Docker --template-file azuredeploy.json`
