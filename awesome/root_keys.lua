local awful = require("awful")
local bars = require("bars")
local commands = require("commands")
local menubar = require("menubar")

local MOD = { "Mod4" }
local MOD_SHIFT = { "Mod4", "Shift" }
local MOD_CTRL = { "Mod4", "Control" }

local function view_tag(t)
    return function()
        local screen = mouse.screen
        local tag = awful.tag.gettags(screen)[t]
        if tag then
            awful.tag.viewonly(tag)
        end
    end
end

local function start(cmd)
    return function() awful.util.spawn(cmd) end
end

local function open_menu()
    menubar.show()
end

local function next_screen()
    local screens = { 3, 1, 4, 2 }
    awful.screen.focus(screens[mouse.screen])
end

local function prev_screen()
    local screens = { 2, 4, 1, 3 }
    awful.screen.focus(screens[mouse.screen])
end

local function focus_screen(s)
    return function()
        awful.screen.focus(s)
    end
end

local function next_client()
    awful.client.focus.byidx(1)
    if client.focus then client.focus:raise() end
end

local function prev_client()
    awful.client.focus.byidx(-1)
    if client.focus then client.focus:raise() end
end

local function swap_prev_client()
    awful.client.swap.byidx(1)
end

local function swap_next_client()
    awful.client.swap.byidx(-1)
end

local keys = awful.util.table.join(
    awful.key(MOD, "h", prev_screen),
    awful.key(MOD, "j", next_client),
    awful.key(MOD, "k", prev_client),
    awful.key(MOD, "l", next_screen),

    awful.key(MOD_SHIFT, "j", swap_next_client),
    awful.key(MOD_SHIFT, "k", swap_prev_client),

    awful.key(MOD, "Return", start(commands.terminal)),
    awful.key(MOD, "y", start(commands.editor)),
    awful.key(MOD, "u", start(commands.terminal)),
    awful.key(MOD, "i", start("firefox")),
    awful.key(MOD, "o", start("google-chrome")),
    awful.key(MOD_CTRL, "r", awesome.restart),
    awful.key(MOD_CTRL, "q", awesome.quit),

    awful.key(MOD, "1", view_tag(1)),
    awful.key(MOD, "2", view_tag(2)),
    awful.key(MOD, "3", view_tag(3)),
    awful.key(MOD, "4", view_tag(4)),

    awful.key(MOD, "7", focus_screen(2)),
    awful.key(MOD, "8", focus_screen(1)),
    awful.key(MOD, "9", focus_screen(3)),
    awful.key(MOD, "0", focus_screen(4)),

    awful.key(MOD, "p", open_menu)
)

root.keys(keys)

return keys
