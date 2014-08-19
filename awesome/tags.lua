-- Tags configuration for all screens

local awful = require("awful")
local layouts = awful.layout.suit

local tags = {
    -- Main screen
    awful.tag({ 1, 2, 3, 4 }, 1, layouts.tile),

    -- Left screen
    awful.tag({ 1, 2, 3, 4 }, 2, layouts.tile),

    -- Right screen
    awful.tag({ 1, 2, 3, 4 }, 3, layouts.tile.top),

    -- Far right screen
    awful.tag({ 1, 2, 3, 4 }, 4, layouts.floating)
}

return tags
