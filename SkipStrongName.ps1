﻿#  Register assemblies for strong name verification skipping

$registryPath = "HKLM:\SOFTWARE\Microsoft\StrongName\Verification"
$publicKeyToken="31bf3856ad364e35"
$assemblies = "FabActUtil",
              "Microsoft.ServiceFabric.Actors",
              "Microsoft.ServiceFabric.Actors.Wcf",
              "Microsoft.ServiceFabric.Services",
              "Microsoft.ServiceFabric.Services.Remoting",
              "Microsoft.ServiceFabric.Services.Wcf",
              "Microsoft.ServiceFabric.Actors.Tests",
              "Microsoft.ServiceFabric.Services.Tests",
              "Microsoft.ServiceFabric.Services.Remoting.Tests",
              "Microsoft.ServiceFabric.StartupServicesUtility"

Write-Host "Registering assemblies generated by this repository for strong name verification skipping."
foreach ($assembly in $assemblies)
{
    $assemblyIdentity = "$assembly,$publicKeyToken"
    New-Item -Path "$registryPath\$assemblyIdentity" -Force | Out-Null
}
