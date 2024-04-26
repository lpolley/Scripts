#Remove User from Group

$Users =
"first.last@domain.com",
"first.last1@domain.com"

foreach($User in $Users){
    $Guid = Get-AzureADuser -ObjectID $User
    remove-AzureADGroupMember -ObjectID "enter object ID from Azure Portal" -RefObjectId $Guid.ObjectID
    Clear-Variable -name "Guid"

}

#License Based group with disabled users in group

Get-AzureADGroupMember -ObjectId "Example of Group GUID" -all $true | where-object{$_.AccountEnabled -like "False" }