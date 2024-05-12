$year = Get-Date -Format "yyyy"
$month = Get-Date -Format "MM"
$day = Get-Date -Format "dd"

$folderPath = ".\content\posts"

# Year - .\content\posts\2024
$folderPath = Join-Path -Path $folderPath -ChildPath $year
New-Item -ItemType Directory -Path $folderPath -Force

# $indexPath = Join-Path -Path $folderPath -ChildPath "_index.md"
# New-Item -ItemType File -Path $indexPath -Force

# Month - .\content\2024\05
$folderPath = Join-Path -Path $folderPath -ChildPath $month
New-Item -ItemType Directory -Path $folderPath -Force

# $indexPath = Join-Path -Path $folderPath -ChildPath "_index.md"
# New-Item -ItemType File -Path $indexPath -Force

# Day - .\content\2024\05\12
$folderPath = Join-Path -Path $folderPath -ChildPath $day
New-Item -ItemType Directory -Path $folderPath -Force

# $indexPath = Join-Path -Path $folderPath -ChildPath "_index.md"
# New-Item -ItemType File -Path $indexPath -Force

$templatePath = ".\_template.md"
$postPath = Join-Path -Path $folderPath -ChildPath "index.md"

$dateTime = Get-Date -Format "o"
Get-Content $templatePath `
| ForEach-Object {$_ -replace "%%DATETIME%%", $dateTime} `
| Out-File $postPath -NoClobber

# Open Explorer
Invoke-Item -Path $folderPath

