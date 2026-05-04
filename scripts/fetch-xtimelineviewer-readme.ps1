$url = "https://raw.githubusercontent.com/daruyanagi/XTimelineViewer/main/README.md"
$content = (Invoke-WebRequest -Uri $url -UseBasicParsing).Content

$lines = $content -split "`n"
$title = "XTimelineViewer"
$bodyStart = 0

for ($i = 0; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match '^# (.+)') {
        $title = $Matches[1].Trim()
        $bodyStart = $i + 1
        break
    }
}

$body = ($lines[$bodyStart..($lines.Count - 1)] -join "`n").TrimStart("`n")
$frontMatter = "---`ntitle: `"$title`"`n---`n`n"

$outDir = "content/apps/xtimelineviewer"
New-Item -ItemType Directory -Force -Path $outDir | Out-Null
$frontMatter + $body | Set-Content -Path "$outDir/index.md" -Encoding UTF8

Write-Host "Generated: $outDir/index.md"
Write-Host "Title: $title"
