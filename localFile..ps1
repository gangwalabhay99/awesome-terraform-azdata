# Ensures you do not inherit an AzContext in your runbook
Disable-AzContextAutosave -Scope Process

$Conn = Get-AutomationConnection  -Name "AzureRunAsConnection"
Connect-AzAccount -ServicePrincipal -Tenant $Conn.TenantID `
-ApplicationId $Conn.ApplicationID -CertificateThumbprint $Conn.CertificateThumbprint

$AzureContext = Select-AzSubscription -SubscriptionId $Conn.SubscriptionID
Get-AzVM
# start vm 
Restart-AzVM -ResourceGroupName "Automation-RG" -Name "Automation-VM"
