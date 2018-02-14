#
# simpleUbuntuVMDelete.ps1
#
Param(
	[string] $ResourceGroupLocation = "westeurope",
	[string] $DeployIndex = "",
	[string] $ResourceGroupPrefix = "Ubuntu-RG",
	[string] $AzureUserName = "admin@<mytenant>.onmicrosoft.com",
	[string] $AzureUserPassword = "<password>"
)

# Prepare credentials and login to Azure subscription. 
$AadPass = ConvertTo-SecureString $AzureUserPassword -AsPlainText -Force
$AadCred = New-Object System.Management.Automation.PSCredential ($AzureUserName, $Aadpass)
Login-AzureRmAccount -Credential $AadCred

# Prepare environment variables.  
$ResourceGroupName = $ResourceGroupPrefix + $DeployIndex

# Delete resource group with all objects
Remove-AzureRmResourceGroup -Name $ResourceGroupName -Verbose -Force
Write-Host 'Resource group ' -NoNewline
Write-Host @($ResourceGroupName) -BackgroundColor Green -ForegroundColor Black -NoNewline
Write-Host ' was deleted'
