local M = {}
M.Main = msg.url("main:/main#main")

M.INPUT_FOCUS_GET=hash("acquire_input_focus")
M.INPUT_FOCUS_RELEASE=hash("release_input_focus")
M.INPUT_TOUCH=hash("touch")

M.PHYSICS_MESSAGE_CONTACT   = hash("contact_point_response")
M.PHYSICS_MESSAGE_COLLISION = hash("collision_response")
M.PHYSICS_MESSAGE_TRIGGER = hash("trigger_response")

M.MESSAGE_SET_SCORE=hash("set_score")
M.MESSAGE_INCREASE_SCORE=hash("increase_score")
M.MESSAGE_GAME_OVER=hash("game_over")

M.MESSAGE_PLAY_SOUND=hash("play_sound")

M.SCORE = hash("score")
M.DIRT = hash("dirt")
return M