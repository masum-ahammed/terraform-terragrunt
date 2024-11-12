# Define source and destination paths
$sourcePath = "C:\Source Code\terraform-terragrunt"
$destinationPath = "\\wsl.localhost\Ubuntu\home\masum\sourcecode"

# Remove existing files and directories in the destination
Remove-Item -Path "$destinationPath\*" -Recurse -Force

# Copy files from source to destination
Copy-Item -Path $sourcePath -Destination $destinationPath -Recurse
