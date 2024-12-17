# Define the path to the directory you want to organize
$path = "C:\Users\TobiasSlettli\Documents\Powershell"

# Get all files in the directory
$files = Get-ChildItem -Path $path -File

# Loop through each file
foreach ($file in $files) {
    # Get the file extension
    $extension = $file.Extension.TrimStart('.')
    
    # Define the target directory based on the extension
    $targetDir = Join-Path -Path $path -ChildPath $extension
    
    # Create the target directory if it doesn't exist
    if (-not (Test-Path -Path $targetDir)) {
        New-Item -Path $targetDir -ItemType Directory
    }
    
    # Move the file to the target directory
    Move-Item -Path $file.FullName -Destination $targetDir
}

Write-Host "Files have been organized by their extensions."