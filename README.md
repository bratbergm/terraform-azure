# Terraform

This repo is meant as a showcase for terraform in Azure.



## **Level 1**

- Basic resource provisioning with only resources: resource group, network, VMs, SQL server, database ..

```
📦level1
 ┣ 📜backend.tf
 ┣ 📜main.tf
 ┣ 📜output.tf
 ┗ 📜variables.tf
```

## **Level 2**

- The resources are separated into modules 
- Possible to provision one module at the time *(terraform plan --target=module."declared module name"*)

```
📦level2
 ┣ 📂modules
 ┃ ┣ 📂1-vnet
 ┃ ┃ ┣ 📜main.tf
 ┃ ┃ ┣ 📜outputs.tf
 ┃ ┃ ┗ 📜variables.tf
 ┃ ┣ 📂2-vms
 ┃ ┃ ┣ 📜main.tf
 ┃ ┃ ┣ 📜outouts.tf
 ┃ ┃ ┗ 📜variables.tf
 ┃ ┗ 📂3-sql
 ┃ ┃ ┣ 📜main.tf
 ┃ ┃ ┣ 📜output.tf
 ┃ ┃ ┗ 📜variables.tf
 ┣ 📜backend.tf
 ┣ 📜main.tf
 ┣ 📜output.tf
 ┗ 📜variables.tf
```

**Variables**

*"Global" variable "location" used in a module:*

![terraformAzureVariables](/img/terraformAzureVariables.png)



*Variable "subnet_id" from VNET module used in VMs module:*

![TarraformVariablesModules](/img/TarraformVariablesModules.png)

## **Level 3**

- The use of multiple environments: test/stage/prod
- Environments are differentiated with a *.tfvars* file for each environment. The same code provisions the 3 environments, and variables in the *.tfvars* files creates differences. 
- Provision the desired environment: *terraform plan --var-file="test/test.tfvars"*

```
📦level3
 ┣ 📂modules
 ┃ ┣ 📂1-vnet
 ┃ ┃ ┣ 📜main.tf
 ┃ ┃ ┣ 📜outputs.tf
 ┃ ┃ ┗ 📜variables.tf
 ┃ ┣ 📂2-vms
 ┃ ┃ ┣ 📜main.tf
 ┃ ┃ ┣ 📜outputs.tf
 ┃ ┃ ┗ 📜variables.tf
 ┃ ┗ 📂3-sql
 ┃ ┃ ┣ 📜main.tf
 ┃ ┃ ┣ 📜output.tf
 ┃ ┃ ┗ 📜variables.tf
 ┣ 📂prod
 ┃ ┗ 📜prod.tfvars
 ┣ 📂stage
 ┃ ┗ 📜stage.tfvars
 ┣ 📂test
 ┃ ┗ 📜test.tfvars
 ┣ 📜backend.tf
 ┣ 📜main.tf
 ┣ 📜output.tf
 ┗ 📜variables.tf
```





**Misc**
**Connect with PowerShell to Azure Subscription**

```
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

$PSVersionTable.PSVersion
# Version 7.1 ^ 

# Module
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
Import-Module Az 

# Install Azure CLI (Be Admin)
$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; rm .\AzureCLI.msi

# Update it
az upgrade

# Install Terraform on Windows:
# https://docs.microsoft.com/en-us/azure/developer/terraform/get-started-windows-powershell?tabs=bash

# Login 
az login
# Or
Connect-AzAccount

# Check what Subscription you are currently in
Get-AzContext

```
