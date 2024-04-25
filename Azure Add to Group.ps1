#Azure Powershell add to group(Cloud User Group/Cloud License Group)

$Users =
"username1@domain.com",
"username1@domain.com"

foreach($User in $Users){
    $Guid = Get-AzureADuser -ObjectID $User
    add-AzureADGroupMember -ObjectID "enter object ID from Azure Portal" -RefObjectId $Guid.ObjectID
    Clear-Variable -name "Guid"

}