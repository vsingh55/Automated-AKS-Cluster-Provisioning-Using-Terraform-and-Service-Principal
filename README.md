# Automated AKS Cluster Provisioning Using Terraform and Service Principal

In this project, we will create an AKS cluster in a streamlined and secure manner using a service principal. The kubeconfig and service principal will be generated post-terraform plan, and the secret will be uploaded to Azure Key Vault for subsequent usage.

## Architechture Diagram

[
![output](https://github.com/user-attachments/assets/858de14b-dd7a-46c8-9ccd-16ebf25d6f5b)
](url)
## Resources Created by Terraform Configuration

1. **Resource Group**
2. **Service Principal**
3. **AKS Cluster**
4. **Azure Key Vault**
5. **Key Vault Secret**
6. **Kubeconfig**
7. **AKS Monitoring**

**Feature of Project:**

To make the Terraform configuration more robust and maintainable, considered the following enhancement:

**Modularized Terraform Configuration:** Split the configuration into modules for better organization.

>**Added Detailed Comments:** Included comments in your Terraform files to explain each resource and its purpose.

>**Implemented Output Variables:** Used output variables to capture and display critical information like the kubeconfig location and Key Vault secrets.

## Use Cases:

This automated AKS setup can be used in various scenarios:

1. DevOps Automation:

Automate the setup and management of Kubernetes clusters as part of your CI/CD pipeline. This ensures that your development, testing, and production environments are consistent and reproducible.

2. Multi-Environment Deployment:

Easily deploy Kubernetes clusters across multiple environments (e.g., development, staging, production) with consistent configurations. Each environment can have its own set of variables and configurations, ensuring isolated and secure deployments.

3. Disaster Recovery:

By using Terraform, you can quickly recreate your entire AKS infrastructure in case of a disaster. This ensures minimal downtime and quick recovery, as the entire setup is defined in code and can be reapplied.

4. Compliance and Security:

Ensure that your AKS clusters are compliant with organizational security policies by defining and managing all configurations through code. This includes secure storage of credentials, role assignments, and monitoring setups.

5. Scalable Infrastructure:

Automate the scaling of your AKS clusters based on workload demands. This allows you to dynamically adjust the size and capacity of your clusters, optimizing resource usage and cost.



## Pre-requisites

- `kubectl` CLI installed
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed and logged in
- Create Storage Account and blob container to store the Terraform state file as **backend**. You can use the [shell script](BackendRequirement.sh).


![AKS-TF-2024-07-24-175100](https://github.com/user-attachments/assets/818187ab-c193-4912-91e1-ce08c494774d)

**Flow CHart:**
![Untitled diagram-2024-07-24-215305](https://github.com/user-attachments/assets/360b9593-0fc5-40eb-8b95-8fe4a892e8df)


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


## Blog 🖥️

Check out the Blog below for detailed desscription of this project: [click here](https://blogs.vijaysingh.cloud/automate-aks)
