if( [System.Environment]::OSVersion.Version.Build -lt 26100 ) {
    'This script requires Windows 11 24H2 or later.' | Write-Warning;
    return;
}
$timeout = [datetime]::Now.AddMinutes( 5 );
$exe = "$env:LOCALAPPDATA\Microsoft\WindowsApps\winget.exe";

while( $true ) {
    if( $exe | Test-Path ) {
        $apps = @(
            "7zip.7zip",
            "VideoLAN.VLC",
            "HandBrake.HandBrake",
            "Valve.Steam",
            "Mozilla.Firefox.DeveloperEdition",
            "Mozilla.Firefox", # Firefox
            "Opera.Opera", #Opera
            "Microsoft.PowerShell",
            "ElectronicArts.EADesktop",
            "Facebook.Messenger",
            "OpenWhisperSystems.Signal",
            "Microsoft.WindowsTerminal",
            "Microsoft.PowerToys",
            "Armin2208.WindowsAutoNightMode",
            "TechPowerUp.NVCleanstall",
            "yt-dlp.yt-dlp",
            "Discord.Discord", #Discord
            "Gyan.FFmpeg.Shared",
            "Ubisoft.Connect",
            "Microsoft.PowerToys",
            "Microsoft.VisualStudioCode",
            "sysinternals",
            "Zen-Team.Zen-Browser"
        )

        foreach ($app in $apps) {
#            & $exe install --exact --id $app --silent --accept-package-agreements --accept-source-agreements --source winget --scope machine;
            & $exe install --exact --id $app --silent --accept-package-agreements --source winget --accept-source-agreements;
        }
        return;
    }
    if( [datetime]::Now -gt $timeout ) {
        'File {0} does not exist.' -f $exe | Write-Warning;
        return;
    }
    Start-Sleep -Seconds 1;
}
