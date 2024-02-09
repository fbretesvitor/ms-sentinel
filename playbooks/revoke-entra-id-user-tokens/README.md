## Revoke Entra ID user tokens

The following playbook intends to revert entra id user tokens

## Purpose

When a user got risky status, the SOC team can automatically refresh all entra id tokens to require target user to re-authenticate

## Requirements

The following table present the requirements:
| Resource                    |  Permissions                               | Notes                                                   |
| ----------------------------| ------------------------------------------ | --------------------------------------------------------| 
| **System Managed identity** | Key Vault Secrets user                     | Is the playbook ID. Only available after the deployment |
| **App registration**        | Microsoft Graph \ App \ User.ReadWrite.All | Secret add to Azure Key Vault                           | 
| **Key Vault**               |                                            | Key Vault to host secrets to be consumed by Sentinel playbooks |
