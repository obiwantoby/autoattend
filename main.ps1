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
            "9PKTQ5699M62", #iCloud
            "Mozilla.Firefox.DeveloperEdition",
            "9NZVDKPMR9RD", # Firefox
            "XP8CF6S8G2D5T6", #Opera
            "Microsoft.PowerShell",
            "ElectronicArts.EADesktop",
            "Facebook.Messenger",
            "OpenWhisperSystems.Signal",
            "Microsoft.WindowsTerminal",
            "Microsoft.PowerToys",
            "Armin2208.WindowsAutoNightMode",
            "TechPowerUp.NVCleanstall",
            "yt-dlp.yt-dlp",
            "XPDC2RH70K22MN", #Discord
            "9WZDNCRFJBH4",
            "Gyan.FFmpeg.Shared",
            "9msmlrh6lzf3",
            "Ubisoft.Connect",
            "9P8LTPGCBZXD",
            "XP9KHM4BK9FZ7Q",
            "sysinternals",
            "Zen-Team.Zen-Browser",
            "9NZKPSTSNW4P" # Xbox GameBar
        )

        foreach ($app in $apps) {
#            & $exe install --exact --id $app --silent --accept-package-agreements --accept-source-agreements --source winget --scope machine;
            & $exe install --exact --id $app --silent --accept-package-agreements --accept-source-agreements;
        }
        return;
    }
    if( [datetime]::Now -gt $timeout ) {
        'File {0} does not exist.' -f $exe | Write-Warning;
        return;
    }
    Start-Sleep -Seconds 1;
}
