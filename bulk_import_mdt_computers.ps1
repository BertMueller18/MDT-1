#Custom Variables

$Module = "C:\tempere\MDTDB.psm1"
$SQLServer = "sccm2012"
$DatabaseName = "deployment"
$CSV = "C:\tempere\computers.csv"

Import-Module $Module
Connect-MDTDatabase –sqlServer $SQLServer –database $DatabaseName
$Computers = Import-Csv $CSV

For ($i=1; $i -le $Computers.count; $i++)
{
New-MDTComputer -macAddress $Computers[$i-1].mac -uuid $Computers[$i-1].UUID -description $Computers[$i-1].name -settings @{ OSInstall='YES'; OSDComputerName=$computers[$i-1].name;}
}
