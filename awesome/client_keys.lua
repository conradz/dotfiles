local awful = require("awful")

local MOD = { "Mod4" }
local MOD_SHIFT = { "Mod4", "Shift" }
local MOD_CTRL = { "Mod4", "Control" }

local function to_screen(screen)
    return function(c)
        awful.client.movetoscreen(c, screen)
    end
end

local function to_next_screen(c)
    local screens = { 3, 1, 4, 2 }
    awful.client.movetoscreen(c, screens[c.screen])
end

local function to_prev_screen(c)
    local screens = { 2, 4, 1, 3 }
    awful.client.movetoscreen(c, screens[c.screen])
end

local function to_tag(t)
    return function(c)
        local tags = awful.tag.gettags(c.screen)
        awful.client.movetotag(tags[t], c)
    end
end

local function toggle_floating(c)
    awful.client.floating.toggle(c)
end

local function toggle_fullscreen(c)
    c.fullscreen = not c.fullscreen
end

local function set_master(c)
    c:swap(awful.client.getmaster())
end

local function close(c)
    c:kill()
end

return awful.util.table.join(
    awful.key(MOD, "c", close),

    awful.key(MOD_CTRL, "h", to_prev_screen),
    awful.key(MOD_CTRL, "l", to_next_screen),
    awful.key(MOD_CTRL, "7", to_screen(2)),
    awful.key(MOD_CTRL, "8", to_screen(1)),
    awful.key(MOD_CTRL, "9", to_screen(3)),
    awful.key(MOD_CTRL, "0", to_screen(4)),

    awful.key(MOD_SHIFT, "1", to_tag(1)),
    awful.key(MOD_SHIFT, "2", to_tag(2)),
    awful.key(MOD_SHIFT, "3", to_tag(3)),
    awful.key(MOD_SHIFT, "4", to_tag(4)),

    awful.key(MOD, "r", awful.client.restore),

    awful.key(MOD, "f", toggle_floating),
    awful.key(MOD, "space", toggle_fullscreen),
    awful.key(MOD_SHIFT, "Return", set_master)
)
