# Terraform

This repo is meant as a showcase for terraform in Azure.



### **Level 1**

- Basic resource provisioning with only resources: resource group, network, VMs, SQL server, database ..

```
📦level1
 ┣ 📜backend.tf
 ┣ 📜main.tf
 ┣ 📜output.tf
 ┗ 📜variables.tf
```

### **Level 2**

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

![terraformAzureVariables](/img/terraformAzureVariables.png)





### **Level 3**



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
