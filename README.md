# Azure Policy Examples

## Prerequisite

Run the following command to register the provider with subscription:

```
# az provider register --namespace 'Microsoft.PolicyInsights'
```

## Policy Script

The ```policy.sh``` script shows examples of creating the following policies that are applied to all of the Azure Resources created in other repos in this GitHub account.

* Resource Type Restrictions in the Network Resource Group
    * Restricts resource types to the following resources:
        * Virtual Networks
        * Network Security Groups
        * Application Security Groups
* Resource Type Restrictions in the Vault Resource Group
    * Restricts resources to Key Vaults.
* Resource Type Restrictions at the Subscription Level
    * Restricts resources in the Azure Subscription, but excluding the Network and Vault Resource Groups, to the following resources:
        * Availability Sets
        * Load Balancers
        * Public IP Addresses
        * Storage Accounts
        * Network Interfaces
        * Virtual Machines
        * Disks
        * Virtual Machine Extensions
* Resource Location Restrictions at the Subscription Level
    * Restricts resources in the Azure Subscription to the East US location
* Tag Enforcement at the Subscription Level
    * Enforces a requirement that all resources in the Azure Subscription must have a tag named "Cost Center" with the value of "Marketing"