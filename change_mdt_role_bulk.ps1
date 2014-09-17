#Use this to Export a formatted list:
#Get-MDTComputer | Where-Object {$_.osdcomputername -like "*" } | select osdcomputername,id | export-csv -Path ""

#Custom Variables

$Module = ""
$SQLServer = ""
$DatabaseName = ""
$CSV = "c:\temp\new_csv."

Import-Module $Module
Connect-MDTDatabase –sqlServer $SQLServer –database $DatabaseName
$Computers = Import-Csv $CSV

Foreach ($Computer in $Computers)
{
Set-MDTComputerRole $Computer.id -roles $Computer.Role
}
