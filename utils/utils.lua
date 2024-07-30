-- utils.lua

local utils = {}

local screen_width, screen_height

function utils.init()
    -- Initialize cached values
    local w, h = window.get_size()
    screen_width = w
    screen_height = h
end

function utils.screen_to_world(sx, sy, sz, window_width, window_height, projection, view)
    local inv = vmath.inv(projection * view)
    sx = (2 * sx / window_width) - 1
    sy = (2 * sy / window_height) - 1
    sz = (2 * sz) - 1
    local wx = sx * inv.m00 + sy * inv.m01 + sz * inv.m02 + inv.m03
    local wy = sx * inv.m10 + sy * inv.m11 + sz * inv.m12 + inv.m13
    local wz = sx * inv.m20 + sy * inv.m21 + sz * inv.m22 + inv.m23
    return wx, wy, wz
end

-- Not sure if it's expensive to get the window width and height every time this is called
function utils.screen_to_world_with_camera(sx, sy, sz, window_width, window_height, camera)
    local projection = go.get(camera, "projection")
    local view = go.get(camera, "view")
    local inv = vmath.inv(projection * view)
    sx = (2 * sx / window_width) - 1
    sy = (2 * sy / window_height) - 1
    sz = (2 * sz) - 1
    local wx = sx * inv.m00 + sy * inv.m01 + sz * inv.m02 + inv.m03
    local wy = sx * inv.m10 + sy * inv.m11 + sz * inv.m12 + inv.m13
    local wz = sx * inv.m20 + sy * inv.m21 + sz * inv.m22 + inv.m23
    return wx, wy, wz
end

function utils.get_camera_corner_points(camera)
    local w, h = window.get_size()
    local projection = go.get(camera, "projection")
    local view = go.get(camera, "view")

    local topLeftx, topLefty = utils.screen_to_world(0, h, 0, w, h, projection, view)
    local topRightx, topRighty = utils.screen_to_world(w, h, 0, w, h, projection, view)
    local bottomLeftx, bottomLefty = utils.screen_to_world(0, 0, 0, w, h, projection, view)
    local bottomRightx, bottomRighty = utils.screen_to_world(w, 0, 0, w, h, projection, view)

    local world_points = {
        top_left = vmath.vector3(topLeftx, topLefty, 5),
        top_right = vmath.vector3(topRightx, topRighty, 5),
        bottom_left = vmath.vector3(bottomLeftx, bottomLefty, 5),
        bottom_right = vmath.vector3(bottomRightx, bottomRighty, 5)
    }

    return world_points
end

-- Add the save and load functions for best score
function utils.save_best_score(score)
    local data = {
        best_score = score
    }
    sys.save(sys.get_save_file("my_unique_game_id", "save_data"), data)
end

function utils.load_best_score()
    local data = sys.load(sys.get_save_file("my_unique_game_id", "save_data"))
    if data and data.best_score then
        return data.best_score
    else
        return 0 -- default value if there's no saved data
    end
end

return utils