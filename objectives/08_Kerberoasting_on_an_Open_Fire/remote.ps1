


$SecStringPassword = "76492d1116743f0423413b16050a5345MgB8AGcAcQBmAEIAMgBiAHUAMwA5AGIAbQBuAGwAdQAwAEIATgAwAEoAWQBuAGcAPQA9AHwANgA5ADgAMQA1ADIANABmAGIAMAA1AGQAOQA0AGMANQBlADYAZAA2ADEAMgA3AGIANwAxAGUAZgA2AGYAOQBiAGYAMwBjADEAYwA5AGQANABlAGMAZAA1ADUAZAAxADUANwAxADMAYwA0ADUAMwAwAGQANQA5ADEAYQBlADYAZAAzADUAMAA3AGIAYwA2AGEANQAxADAAZAA2ADcANwBlAGUAZQBlADcAMABjAGUANQAxADEANgA5ADQANwA2AGEA"
# $password = ConvertTo-SecureString "Password!@12" -AsPlainText -Force
$password = $SecStringPassword | ConvertTo-SecureString -Key 2,3,1,6,2,8,9,9,4,3,4,5,6,8,7,7
# $creds = New-Object System.Management.Automation.PSCredential -ArgumentList ("vulns.local\chrisd", $password)
$creds = New-Object System.Management.Automation.PSCredential -ArgumentList ("elfu.local\remote_elf", $password)

# Invoke-Command -ComputerName 10.128.1.53 -ScriptBlock { Get-Process } -Credential $aCred -Authentication Negotiate
# Enter-PSSession -ComputerName WIN-4JFNT305Q5J.vulns.local -Credential $creds -Authentication Negotiate

Enter-PSSession -ComputerName 10.128.1.53 -Credential $creds -Authentication Negotiate
# Enter-PSSession -ComputerName 172.17.0.5 -Credential $creds -Authentication Negotiate
