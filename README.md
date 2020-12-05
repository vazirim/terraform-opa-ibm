
# terraform-opa-ibm

-   [Introduction](#introduction)
-   [How does terraform-opa-ibm work?](#how-does-terraform-opa-ibm-work)
-   [Framework structure](#framework-structure)
-   [Evaluating terraform-plan locally](#running-terraform-opa-ibm-locally)


## Introduction

This is a Rego based policy library, the policy language used by the Open Policy Agent (OPA), for Terraform Provider for IBM Cloud.  It is designed to be a helper for your own OPA Policy repository.  This Rego library provides a simple abstractions to read the policy-information generated by Terraform and support IaC tools.  For example plan json file and state file, etc., in a common and consistent manner.  It also include a set of generic and customizable Rego rules for IBM Cloud resources, provisioned using `Terraform Provider for IBM Cloud`. It can be used with a tool that evaluates Terraform infrastructure-as-code for potential IBMCloud misconfigurations and compliance violations prior to deployment.

## Framework structure

The directory structure for the frame work is as shown below.

```
terraform-opa-ibm
├── README.md
├── lib
│   ├── plan
│   │   └── base_tfplan.rego
│   └── state
│       └── state.rego
└── resources
    ├── ibm_container_vpc_cluster
    │   └── ibm_container_vpc_cluster.rego
    ├── ibm_is_public_gateway
    │   └── ibm_is_public_gateway.rego
    ├── ibm_is_subnet
    │   └── ibm_is_subnet.rego
    └── ibm_is_vpc
        └── ibm_is_vpc.rego
    .
    .
    .
```

- lib directory has Rego functions for terraform plan and generic rules.
- resources directory has the rules-evaluation logic for individual ibmcloud resource.


## Evaluating terraform-plan locally

Install the prerequisites:

- [OPA](https://www.openpolicyagent.org/docs/latest/#1-download-opa)
- [Terraform 0.12+](https://www.terraform.io/downloads.html)

## How does terraform-opa-ibm work?

terraform-opa-ibm provides a Rego based function to read the IBM Cloud 'resource' information, provisioned using `Terraform Provider for IBM Cloud`. The functions available to read:

* Resource information from Terraform plan file.
* Resource information from Terraform state file.

##  How to use terraform-opa-ibm in the users policy repo:

### Run the following command:

`git-vendor https://github.com/IBM-Cloud/terraform-opa-ibm.git`

use the the directory where `terraform-opa-ibm` is vendored and Rego code defined while evaluating the policy. 

Some example:

To check Terraform plan file against `terraform-op-ibm` based rules:
```opa eval --format pretty  -d <path_to_terraform-opa-ibm based rule> -d <path-to-plan-json-file> "data.terraform.analysis.ibm.cos"```

To check Terraform state file against `terraform-op-ibm` based rules:
```opa eval --format pretty  -d <path_to_terraform-opa-ibm based rule> -d <path-to-state-json-file> "data.terraform.analysis.ibm.cos"```
