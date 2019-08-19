cls        

function getReg{
    param(
        [string]$softwareName
        )
 
    $reg = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall'

    $res = Get-ChildItem -Path $reg

    $soft = $res | Get-ItemProperty | Where-Object {$_.DisplayName -like "*$softwareName*" }

    $soft | Select-Object -Property DisplayName, DisplayVersion, InstallLocation, UninstallString

    try{
        $vers = $soft.DisplayVersion
        $ustr = $soft.UninstallString
        }
    catch{}
    }
