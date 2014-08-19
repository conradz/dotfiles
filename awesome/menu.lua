local awful = require("awful")
local commands = require("commands")

local menu = awful.menu({
    items = {
        { "Editor", commands.editor },
        { "Terminal", commands.terminal },
        { "Edit Config", commands.editor .. " " .. awesome.conffile },
        { "Restart", awesome.restart },
        { "Quit", awesome.quit }
    }
})

return menu
