
Import-Module ActiveDirectory

$firstname = Read-Host -Prompt "Please enter the first name"
$lastname = Read-Host -Prompt "Please enter the last name"
$password = Read-Host -Prompt "Please enter the password"

New-ADUser `
    -Name "$firstname $lastname" `
    -GivenName $firstname `
    -Surname $lastname `
    -UserPrincipalName "$firstname.$lastname" `
    -AccountPassword (ConvertTo-SecureString "$password" -AsPlainText -Force) `
    -Path "OU=Domain Users, OU=doimain, DC=domain, DC=com" `
    -ChangePasswordAtLogon 1 `
    -Enabled 1


add-ADGroupMember -Identity "testGroup" -Members "$firstname.$lastname"