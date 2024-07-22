local M = {}

M.INPUT_FOCUS_GET=hash("acquire_input_focus")
M.INPUT_FOCUS_RELEASE=hash("release_input_focus")
M.INPUT_TOUCH=hash("touch")

M.PHYSICS_MESSAGE_CONTACT   = hash("contact_point_response")
M.PHYSICS_MESSAGE_COLLISION = hash("collision_response")
M.PHYSICS_MESSAGE_TRIGGER = hash("trigger_response")

M.DIRT = hash("dirt")
return M