#Custom Variables

$ModulePath = ''
$SQLServer = ''
$DatabaseName = ''

Import-Module $modulepath
Connect-MDTDatabase –sqlServer $SQLServer –database $DatabaseName