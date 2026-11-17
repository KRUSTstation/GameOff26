local druid = require "druid.druid"

local GlobalGUI = {}

---@param main_node string
function GlobalGUI.resize(main_node)
	local background = gui.get_node(main_node)

	local width = gui.get_width()
	local height = gui.get_height()

	local centre = vmath.vector3(width / 2, height / 2, 0)
	gui.set_size(background, vmath.vector3(width, height, 0))
	gui.set_position(background, centre)
end

return GlobalGUI