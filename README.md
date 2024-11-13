# Infrastructure as Code - Assignment 2

## Configuration

- Subscription ID variable needs to be set with your ID in the \*.tfvars file located in the root folder (./simonhou-oppg2/).
- Variables can be changed in the _terraform.tfvars_ file located in the root folder (./simonhou-oppg2/).

## Requirements

Needed to run locally:

- [**Terraform CLI Installation Guide**](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [**Microsoft Azure CLI Installation Guide**](https://learn.microsoft.com/en-us/cli/azure/install-azure-cl)

## Deployment

1. Deploy from your terminal of choice and make sure to be placed in the root directory (./simonhou-oppg2/).
2. `terraform -chdir=global init`
3. `terraform -chdir=global plan -out="backend.tfplan"`
4. `terraform -chdir=global apply "backend.tfplan"`
5. `terraform -chdir=deployments init`
6. `terraform -chdir=deployments plan -out="main.tfplan"`
7. `terraform -chdir=deployments apply "main.tfplan"`

## Modules

This Terraform project consists of the following child modules:

### App

Creates Azure Service Plan for hosting the web application and a Linux Web App

### Database

Stores product and user data

### Network

Creates Virtual Network, Subnet, Network Security Group and Load Balancer:

- The Network Security Group allows inbound access to port 443 (HTTPS)

### Storage

Azure Storage Account and container for product images.

## Backend

The backend needs to be deployed before the main infrastructure. It stores all tfstate files.

## Github Workflow Files

One for each environment (the apply job will use environment rules so adding a review requirement in GitHub is possible):

- Development (**dev.yml**) used for the dev branch
- Staging (**stage.yml**) used for the stage branch
- Production (**prod.yml**) used for the main branch

Destroy Infrastructure (**destroy.yml**)

- Only able to run manually through GitHub

All the workflows use GitHub environment secrets for storing Azure credentials:

- **ARM_CLIENT_ID** needs to be set as the Azure app ID
- **ARM_CLIENT_SECRET** as the Azure password
- **ARM_TENANT_ID** as the Azure tenant ID
- **ARM_SUBSCRIPTION_ID** as the Azure subscription ID

## Known Issues

## Future Implementation

## Contact

[Simon Houmb - simonhou@ntnu.stud.no](simonhou@ntnu.stud.no)
