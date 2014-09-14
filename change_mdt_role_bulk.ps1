#Custom Variables

$Module = "C:\tempere\MDTDB.psm1"
$SQLServer = "sccm2012"
$DatabaseName = "deployment"
$CSV = "C:\tempere\computers_roles.csv"

Import-Module $Module
Connect-MDTDatabase –sqlServer $SQLServer –database $DatabaseName
$Computers = Import-Csv $CSV

For ($i=1; $i -le $Computers.count; $i++)
{
Set-MDTComputerRole -id $Computers[$i-1].id -roles $Computers[$i-1].Role
}
