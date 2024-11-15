# Terraform Configuration for Grafana Synthetic Monitoring

This repository contains Terraform configurations to set up synthetic monitoring checks using Grafana. Follow the instructions below to plan and apply the Terraform configurations.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- A Grafana account with API access.
- API keys for Grafana and Synthetic Monitoring.

## Setup

### Export Required Environment Variables

Before running Terraform commands, you need to export the necessary environment variables for authentication. Replace `your_api_key_here` and `your_sm_api_key_here` with your actual API keys.

```bash
export TF_VAR_grafana_api_key="your_api_key_here"
export TF_VAR_grafana_sm_api_key="your_sm_api_key_here"
```

## Initialize Terraform

Run the following command to initialize the Terraform working directory. This will download the necessary provider plugins.

```bash
terraform init
```

## Terraform Plan

To see what changes Terraform will make to your infrastructure, run the following command. This will show a detailed plan of the actions Terraform will take.

```bash
terraform plan
```

## Terraform Apply

Once you are satisfied with the plan, apply the changes to your infrastructure with the following command. This will create or update the resources as defined in your Terraform configuration.

```bash
terraform apply
```

You will be prompted to confirm the action. Type yes to proceed.

## Configuration Details

* Provider: The configuration uses the Grafana provider to interact with Grafana's API.
* Resources: Synthetic monitoring checks are created for a list of websites defined in the http_websites variable.
* Frequency: The checks are configured to run at a frequency that ensures you do not exceed 100,000 checks per month. Adjust the frequency in the configuration if needed. Frequency is measured in milliseconds.
