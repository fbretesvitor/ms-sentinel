# Install the module // Only for the first time
#Install-Module AzureAD

# Connect to Azure AD via PowerShell
Connect-AzureAD -TenantId $TenantID

# Set Required variables
$MIGuid = "<ManagedIdentityGuid>" # Get the Managed Identity Guid
$MI = Get-AzureADServicePrincipal -ObjectId $MIGuid

$miMDEAppId = "fc780465-2017-40d4-a0c5-307022471b92" # This parameter is optional. We don’t have to change this value. This corresponds to Graph API Guid
$PermissionName = @(
    "Alert.ReadWrite.All"
    "Machine.Read.All"
    "Machine.ReadWrite.All"
    )

$MDEServicePrincipal = Get-AzureADServicePrincipal -Filter "appId eq '$miMDEAppId'"
$oAppRole = $MDEServicePrincipal.AppRoles | Where-Object {$_.Value -in $PermissionName -and $_.AllowedMemberTypes -contains "Application"}

foreach ($AppRole in $oAppRole){
    New-AzureAdServiceAppRoleAssignment -ObjectId $MI.ObjectId -PrincipalId $MI.ObjectId -ResourceId $MDEServicePrincipal.ObjectId -Id $AppRole.Id
    }
