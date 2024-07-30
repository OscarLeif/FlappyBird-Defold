local M                     = {}
M.Main                      = msg.url("main_collection:/main#main")

--Defold commons
M.INPUT_FOCUS_GET           = hash("acquire_input_focus")
M.INPUT_FOCUS_RELEASE       = hash("release_input_focus")
M.INPUT_TOUCH               = hash("touch")
M.LOAD                      = hash("load")           -- load a proxy
M.UNLOAD                    = hash("unload")         -- unload proxy
M.PROXY_LOADED              = hash("proxy_loaded")   --trigger event when a proxy load
M.PROXY_UNLOADED            = hash("proxy_unloaded") --trigger event when a proxy unload
M.ENABLE                    = hash("enable")
M.DISABLE                   = hash("disable")

-- Physics 2d (No sure about 3D)
M.PHYSICS_MESSAGE_CONTACT   = hash("contact_point_response")
M.PHYSICS_MESSAGE_COLLISION = hash("collision_response")
M.PHYSICS_MESSAGE_TRIGGER   = hash("trigger_response")

--sound
M.MESSAGE_PLAY_SOUND        = hash("play_sound")

--Flappy bird game created for this game not common defold
M.MESSAGE_SET_SCORE         = hash("set_score")
M.MESSAGE_INCREASE_SCORE    = hash("increase_score")
M.MESSAGE_GAME_OVER         = hash("game_over")

M.SCORE                     = hash("score")
M.DIRT                      = hash("dirt")

return M