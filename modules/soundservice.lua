local TableHelper = require "modules.tablehelper"

local SoundService = {}
local active_sounds = {}

local SOUND_GO = "main:/sounds"

local function url(name)
	return SOUND_GO .. "#" .. name
end

function SoundService.play(name, props, callback)
	if not TableHelper.contains(active_sounds, name) then
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

function SoundService.set_volume(group, volume)
	sound.set_group_gain(group, volume)
end

function SoundService.stopall()
	for _, name in pairs(active_sounds) do
		SoundService.stop(name)
	end
end

return SoundService