local active = 0


RegisterNetEvent('imax_core:useThermalVision')
AddEventHandler('imax_core:useThermalVision', function()
	GetThermalVision()
end)

RegisterNetEvent('imax_core:useNightVision')
AddEventHandler('imax_core:useNightVision', function()
	GetNightVision()
end)

RegisterNetEvent('imax_core:dialogMessage')
AddEventHandler('imax_core:dialogMessage', function(message,duration)
	dialogMessage(message,duration)
end)

RegisterNetEvent('imax_core:notification')
AddEventHandler('imax_core:notification', function(message)
	notification(message)
end)

RegisterNetEvent('imax_core:advancednotification')
AddEventHandler('imax_core:advancednotification', function(message,icon,icontype,title,subtitle)
	advancednotification(message,icon,icontype,title,subtitle)
end)

RegisterNetEvent('imax_core:HelpMessage')
AddEventHandler('imax_core:HelpMessage', function(message)
	HelpMessage(message)
end)

RegisterNetEvent('imax_core:spawnNPC')
AddEventHandler('imax_core:spawnNPC', function(x,y,z,name,rotate,ped)
	spawnNPC(x,y,z,name,rotate,ped)
end)

function dialogMessage(message,duration) 
	ClearPrints()
	BeginTextCommandPrint("STRING")
	AddTextComponentSubstringPlayerName(value)
	EndTextCommandPrint(duration, false)
end

function notification(message) 
	BeginTextCommandPrint("STRING")
	AddTextComponentString(message)
	DrawNotification(false, false)
end

function advancednotification(message,icon,icontype,title,subtitle) 
	SetNotificationTextEntry('STRING')
	AddTextComponentSubstringPlayerName(message)
	SetNotificationMessage(icon,icon,false,icontype,title,subtitle)
	DrawNotification(false, false)
end

function HelpMessage(message) 
	AddTextEntry('helpmessage', message)
	DisplayHelpTextThisFrame('helpmessage', false)
end

function spawnNPC(x,y,z,name,rotate,ped) 
	local modelhash = GetHashKey(ped)
	RequestModel(modelhash)
	while not HasModelLoaded(GetHashKey(modelhash)) do
        Wait(1)
	end
	local ped =  CreatePed(4, modelhash,x,y,z, rotate, false, true)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
end

function GetThermalVision()
	if active == 0 then
		SetNightvision(false)
		SetSeethrough(true)
		active = 1
	else
		SetSeethrough(false)
		active = 0
	end
end

function GetNightVision()
	if active == 0 then
		SetNightvision(true)
		active = 1
	else
		SetNightvision(false)
		active = 0
	end
end