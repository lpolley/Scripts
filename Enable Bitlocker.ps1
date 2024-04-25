# Enable BitLocker on the C drive without a startup PIN
Enable-BitLocker -MountPoint "C:" -EncryptionMethod Aes256 -UsedSpaceOnly

# Retrieve BitLocker volume information
$volumeInfo = Get-BitLockerVolume -MountPoint "C:"

# Retrieve BitLocker recovery key
$recoveryKey = $volumeInfo.KeyProtector | Where-Object { $_.KeyProtectorType -eq "RecoveryPassword" }

# Save recovery key to a file on the C drive
$recoveryKeyPath = "C:\BitLockerRecoveryKey.txt"
$recoveryKey.RecoveryPassword | Out-File -FilePath $recoveryKeyPath -Force

# Print BitLocker identifier and recovery key to the terminal window
Write-Host "BitLocker Identifier: $($volumeInfo.VolumeId)"
Write-Host "Recovery Key:"
Get-Content -Path $recoveryKeyPath

# Optionally, you may want to display additional information about the BitLocker volume
# Write-Host "BitLocker Protection Status: $($volumeInfo.ProtectionStatus)"
# Write-Host "Encryption Method: $($volumeInfo.EncryptionMethod)"
