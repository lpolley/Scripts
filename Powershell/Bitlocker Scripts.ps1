# PowerShell Bitlocker Cheat Sheet
# Do not run this as an automated script!

# Get bitlocker information
Get-BitlockerVolume
Get-BitLockerRecoveryInfo -MountPoint <MountPoint>


# Turn off Bitlocker 
#Single Volume decription
Disable-BitLocker -MountPoint "C:"
Get-BitlockerVolume -MountPoint "C:"


#Disable Bitlocker for all volumes 

$BLV = Get-BitLockerVolume

Disable-BitLocker -MountPoint $BLV

#Verify the decryption process Check to ensure that it is at 100% before doing anything else

Get-BitlockerVolume