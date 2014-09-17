#Custom Variables

$Module = "C:\tempere\MDTDB.psm1"
$SQLServer = "sccm2012"
$DatabaseName = "deployment"
$CSV = "C:\tempere\computers.csv"

Import-Module $Module
Connect-MDTDatabase –sqlServer $SQLServer –database $DatabaseName
$Computers = Import-Csv $CSV

Foreach ($Computer in $Computers)
{
New-MDTComputer -macAddress $Computer.mac -uuid $Computer.UUID -description $Computer.name -settings @{ OSInstall='YES'; OSDComputerName=$computer.name;}
}
