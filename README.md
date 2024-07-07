# Automated AKS Cluster Provisioning Using Terraform and Service Principal

In this project, we will create an AKS cluster in a streamlined and secure manner using a service principal. The kubeconfig and service principal will be generated post-terraform plan, and the secret will be uploaded to Azure Key Vault for subsequent usage.

## Architechture Diagram


## Resources Created by Terraform Configuration

1. **Resource Group**
2. **Service Principal**
3. **AKS Cluster**
4. **Azure Key Vault**
5. **Key Vault Secret**
6. **Kubeconfig**

## Pre-requisites

- `kubectl` CLI installed
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed and logged in
- Create Storage Account and blob container to store the Terraform state file as **backend**. You can use the [shell script](BackendRequirement.sh).

## GitMap


## How to use:

### 1. Login to the Azure CLI

```shell
az login --use-device-code
```

### 2. Clone the repository

```shell
git clone https://github.com/vsingh55/Automated-AKS-Cluster-Provisioning-Using-Terraform-and-Service-Principal.git
```

### 3. Initialize the Terraform Providers

```shell
terraform init
```

### 4. Run the Terraform Plan

```shell
terraform plan
```

### 5. Apply the Changes

```shell
terraform apply --auto-approve
```

<!-- ## Common Errors and Resolutions

### Error 1: Service Principal Not Found

```shell
Error: creating Cluster: (Managed Cluster Name 
"clusternew-aks-cluster" / Resource Group "rgname"): 
containerservice.ManagedClustersClient#CreateOrUpdate: 
Failure sending request: StatusCode=404 -- Original Error: 
Code="ServicePrincipalNotFound" Message="Service principal 
clientID: xxxx-xxxxx-xxxx-xxxxx not found in Active Directory
 tenant xxxx-xxxxx-xxxx-xxxxx, Please see https://aka.ms/
 aks-sp-help for more details."
```

#### Resolution:

Rerun the `terraform apply` command. This could be a bug in the particular provider version. Running the command again usually resolves the issue.

### Error 2: Key Vault Secret Permission Issue

```shell
Error: checking for presence of existing Secret 
"xxxx-xxxxx-xxxx-xxxxx" (Key Vault "https://keyvaultname.
vault.azure.net/"): keyvault.BaseClient#GetSecret: Failure 
responding to request: StatusCode=403 -- Original Error: 
autorest/azure: Service returned an error. Status=403 
Code="Forbidden" Message="Caller is not authorized to perform
 action on resource.\r\nIf role assignments, deny assignments
  or role definitions were changed recently, InnerError=
  {"code":"ForbiddenByRbac"}
  
  on main.tf line 46, in resource "azurerm_key_vault_secret"
   "example":      
  46: resource "azurerm_key_vault_secret" "example" {
```

#### Resolution:

Ensure the user has the Key Vault Administrator role, even if the user has the Owner role. -->

## Blog 🖥️

Check out the Blog below for detailed desscription of this project: click here


<!-- https://github.com/vsingh55/3-tier-Architecture-Deployment-across-Multiple-Environments.git) -->

---

<!-- 
## Conclusion

This project demonstrates the automated provisioning of an AKS cluster using Terraform and a service principal, with secrets management via Azure Key Vault. By following the enhanced steps and utilizing the detailed instructions, you can achieve a robust and scalable infrastructure setup. -->