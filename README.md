# Terraform

This repo is meant as a showcase for terraform in Azure.



**Level 1**

- Basic resource provisioning with only resources: resource group, network, VMs, SQL server, database ..

**Level 2**

- Provisioning with use of modules
- The resources are separated into modules 

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

**Level 3**



