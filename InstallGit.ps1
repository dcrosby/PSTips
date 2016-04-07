
# Use Chocolatey to install the git package

((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')) | iex 

# & SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

choco install git -params "/GitAndUnixToolsOnPath" -y




