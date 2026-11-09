local LERP_SMOOTHING_DEFAULT = 1

---@class Camera
---@field camera_id hash
---@field target_id hash|nil
---@field follow_options table|nil
local Camera = {}
Camera.__index = Camera

---@param camera_id hash
---@return Camera
function Camera.new(camera_id)
	local self = setmetatable({}, Camera)

	self.camera_id = camera_id

	-- Following
	self.target_id = nil
	self.follow_options = nil
	--[[
	accepts lerp: int, boundaries: {left: vector, right: vector}, 
	]]

	return self
end

-- Following stuff
---@param target_id hash
---@param options? table
function Camera:follow(target_id, options)
	self.target_id = target_id
	self.follow_options = options or {lerp = LERP_SMOOTHING_DEFAULT}
end

function Camera:unfollow()
	self.target_id = nil
	self.follow_options = nil
end

-- Update loop
function Camera:update()
	-- Follow
	if not self.target_id or not self.follow_options then return end

	local window_width, window_height = window.get_size()
	local zoom = go.get(msg.url(nil, self.camera_id, "camera"), "orthographic_zoom")
	local halfw = window_width / 2 / zoom
	local halfh = window_height / 2 / zoom

	local pos = go.get_position(self.camera_id)
	local goal = go.get_position(self.target_id)
	goal.z = pos.z

	local b = self.follow_options.bounds
	if b then
		if b.left and b.right then
			local min_x = b.left.x + halfw
			local max_x = b.right.x - halfw
			if min_x > max_x then
				goal.x = (b.left.x + b.right.x) / 2 -- level narrower than the view
			else
				goal.x = math.max(min_x, math.min(max_x, goal.x))
			end
		end

		if b.upper and b.lower then
			local min_y = b.lower.y + halfh
			local max_y = b.upper.y - halfh
			if min_y > max_y then
				goal.y = (b.lower.y + b.upper.y) / 2 -- level narrower than the view
			else
				goal.y = math.max(min_y, math.min(max_y, goal.y))
			end
		end
	end

	go.set_position(vmath.lerp(self.follow_options.lerp, pos, goal))
end

return Camera