#!/bin/bash

# Set Variables

```
SubscriptionId="<subId>"
NetworkResourceGroupName=RobNetworkRG
VaultResourceGroupName=VaultRG
```

# Resource Type Restrictions in the Network Resource Group

```
# a08ec900-254a-4555-9bf5-e42af04b5c5c is the built-in policy id for Allowed resource types
az policy assignment create --name 'network-resourcetypes' --scope "/subscriptions/$SubscriptionId/resourceGroups/$NetworkResourceGroupName" --policy "a08ec900-254a-4555-9bf5-e42af04b5c5c" -p '{
    "listOfResourceTypesAllowed": {
        "value": [
            "Microsoft.Network/virtualNetworks",
            "Microsoft.Network/networkSecurityGroups",
            "Microsoft.Network/applicationSecurityGroups"
        ]
    }
}'
```

# Resource Type Restrictions in the Vault Resource Group

```
az policy assignment create --name 'vault-resourcetypes' --scope "/subscriptions/$SubscriptionId/resourceGroups/$VaultResourceGroupName" --policy "a08ec900-254a-4555-9bf5-e42af04b5c5c" -p '{
    "listOfResourceTypesAllowed": {
        "value": [
            "Microsoft.KeyVault/vaults"
        ]
    }
}'
```

# Resource Type Restrictions at the Subscription Level


```
az policy assignment create --name 'application-resourcetypes' --scope "/subscriptions/$SubscriptionId" --not-scopes "/subscriptions/$SubscriptionId/resourceGroups/$NetworkResourceGroupName /subscriptions/$SubscriptionId/resourceGroups/$VaultResourceGroupName" --policy "a08ec900-254a-4555-9bf5-e42af04b5c5c" -p '{
    "listOfResourceTypesAllowed": {
        "value": [
            "Microsoft.Compute/availabilitySets",
            "Microsoft.Network/loadBalancers",
            "Microsoft.Network/publicIPAddresses",
            "Microsoft.Storage/storageAccounts",
            "Microsoft.Network/networkInterfaces",
            "Microsoft.Compute/virtualMachines",
            "Microsoft.Compute/disks",
            "Microsoft.Compute/virtualMachines/extensions"
        ]
    }
}'
```

# Resource Location Restrictions at the Subscription Level

```
# e56962a6-4747-49cd-b67b-bf8b01975c4c is the built-in policy id for Allowed locations
az policy assignment create --name 'east-us-only-location' --scope "/subscriptions/$SubscriptionId" --policy "e56962a6-4747-49cd-b67b-bf8b01975c4c" -p '{
    "listOfAllowedLocations": {
        "value": [
            "East US"
        ]
    }
}'
```

# Tag Enforcement at the Subscription Level

```
# 1e30110a-5ceb-460c-a204-c1c3969c6d62 is the built-in policy id for Enforce tag and its value
az policy assignment create --name 'cost-center-tag-enforcement' --scope "/subscriptions/$SubscriptionId" --policy "1e30110a-5ceb-460c-a204-c1c3969c6d62" -p '{
    "tagname": {
        "value": "Cost Center"
    },
    "tagvalue": {
        "value": "Marketing"
    }
}'
```








