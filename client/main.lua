local active = 0


RegisterNetEvent('imax_core:useThermalVision')
AddEventHandler('imax_core:useThermalVision', function()
	GetThermalVision()
end)

RegisterNetEvent('imax_core:useNightVision')
AddEventHandler('imax_core:useNightVision', function()
	GetNightVision()
end)

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