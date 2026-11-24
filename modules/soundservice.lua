local TableHelper = require "modules.tablehelper"

--[[ 
IMPORTANT!!!!!!!!!!!!!

If the sound is looping, ENSURE that the id of the sound go starts with "loop_" ...
]]

local SoundService = {}
local active_sounds = {}

local COUNTS = {
	walk_wood = 4
}

local SOUND_GO = "main:/sounds"

local function url(name)
	return SOUND_GO .. "#" .. name
end

function SoundService.play(name, props, callback)	
	if not TableHelper.contains(active_sounds, name) and name:sub(1, 5) == "loop_" then
		table.insert(active_sounds, name)
	end
	
	return sound.play(url(name), props, callback)
end

function SoundService.stop(name)
	sound.stop(url(name))

	if TableHelper.contains(active_sounds, name) then
		TableHelper.remove_by_name(active_sounds, name)
	end
end

function SoundService.play_random_sound_from_group(group, props, callback)
	if not COUNTS[group] then return end

	local n = math.random(1, COUNTS[group])
	return SoundService.play(group .. "_" .. n, props, callback)
end

function SoundService.set_volume(group, volume)
	sound.set_group_gain(group, volume)
end

function SoundService.stopall()
	for _, name in pairs(active_sounds) do
		SoundService.stop(name)
	end
end

return SoundService