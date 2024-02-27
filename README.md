# Terraform Storage and Helm Chart (How to use/Install)



## Author 🚀

> Olusola Lanre Akinsulere
---



## Technologies
- Terraform
- HelmChart
- Azure

---


---

---

## Setup Terraform on Azure
- Signup on Azure Cloud
- Download azure-cli for your OS
- Run az login and follow the prompt
- Verify you can see the subscription plans
- Install the terraform plugin for your OS
- Run Terraform init
- Run Terraform apply

---

## Setup and create example Helm chart on Mac
- run brew install Helm
- Create a helm-chart folder
- cd into the created directory run helm create <name-of-chart>
- run helm lint <name-of-chart>
- run helm package <name-of-chart>
- Once the terraform blob storage has been deployed run helm repo index --url <url-of-blob> .


### Upload Helm Chart to Blob Storage
- export AZURE_STORAGE_ACCOUNT=$blobStoreName

- export AZURE_STORAGE_KEY=$(az storage account keys list --resource-group $rg --account-name $blobStoreName | grep -m 1 value | awk -F'"' '{print $4}')
- az storage blob upload --container-name $containerName --file index.yaml --name index.yaml

- az storage blob upload --container-name $containerName --file *.tgz --name *.tgz

---


---

## Thought Process

I wanted to make the blob storage as secure as possible by making use of a sas token on the url of the blob container, the helm chart was a bit manual in uploading, as I didn't see any plugin for the helm chart plugin for azure


---

## Contributions

Todo: 

- Create a more unique storage account name that fits the description of the name requirement
- Write a script to automate the uploading of the helm chart to the blob storage

---

## Challenges

Getting to use the sas token was a bit of an hassle, also creating the subnets within the required virtual network kept on throwing some errors, I was reinitializing a variable that was been passed to the aks module twice, so fixed that, and everything worked out fine.

---

