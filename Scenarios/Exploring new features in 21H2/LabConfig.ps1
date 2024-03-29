$LabConfig=@{AllowedVLANs="1-10,711-719" ; DomainAdminName='LabAdmin'; AdminPassword='LS1setup!' ; <#Prefix = 'WSLab-'#> ; DCEdition='4'; Internet=$true ; TelemetryLevel='Full' ; TelemetryNickname='' ; AdditionalNetworksConfig=@(); VMs=@()}

1..4 | ForEach-Object {$LABConfig.VMs += @{ VMName = "Rolling$_" ; Configuration = 'S2D' ; ParentVHD = 'AzSHCI20H2_G2.vhdx' ; HDDNumber = 10 ; HDDSize= 10TB ; MemoryStartupBytes= 1GB; VMProcessorCount="Max" }}
1..4 | ForEach-Object {$LABConfig.VMs += @{ VMName = "Arc$_"     ; Configuration = 'S2D' ; ParentVHD = 'AzSHCI21H2_G2.vhdx' ; HDDNumber = 4  ; HDDSize= 10TB ; MemoryStartupBytes= 1GB; VMProcessorCount="Max" }}
1..4 | ForEach-Object {$LABConfig.VMs += @{ VMName = "NetATC$_"  ; Configuration = 'S2D' ; ParentVHD = 'AzSHCI21H2_G2.vhdx' ; HDDNumber = 4  ; HDDSize= 10TB ; MemoryStartupBytes= 1GB; VMProcessorCount="Max" }}
1..4 | ForEach-Object {$LABConfig.VMs += @{ VMName = "Thin$_"    ; Configuration = 'S2D' ; ParentVHD = 'AzSHCI21H2_G2.vhdx' ; HDDNumber = 10 ; HDDSize= 10TB ; MemoryStartupBytes= 1GB; VMProcessorCount="Max" }}
1..4 | ForEach-Object {$LABConfig.VMs += @{ VMName = "Other$_"   ; Configuration = 'S2D' ; ParentVHD = 'AzSHCI21H2_G2.vhdx' ; HDDNumber = 10 ; HDDSize= 10TB ; MemoryStartupBytes= 4GB; VMProcessorCount="Max" ; NestedVirt=$True}}

$LabConfig.VMs += @{ VMName = 'SBC' ; Configuration = 'S2D' ; ParentVHD = 'Win2022Core_G2.vhdx' ; SSDNumber = 2; SSDSize=1TB ; HDDNumber = 4; HDDSize= 4TB }

#optional VMs for Windows Admin Center
#$LabConfig.VMs += @{ VMName = 'WACGW' ; ParentVHD = 'Win2022Core_G2.vhdx' }
#$LabConfig.VMs += @{ VMName = 'Win11' ; ParentVHD = 'Win1121H2_G2.vhdx' }
