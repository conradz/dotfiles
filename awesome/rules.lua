local awful = require("awful")
local beautiful = require("beautiful")
local tags = require("tags")
local client_keys = require("client_keys")
local tags = require("tags")

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    {
        rule = { },
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = client_keys,
            buttons = awful.util.table.join(
                awful.button({ }, 1, function(c) client.focus = c; c:raise() end),
                awful.button({ "Mod4" }, 1, awful.mouse.client.move),
                awful.button({ "Mod4" }, 3, awful.mouse.client.resize))
        }
    },

    {
        rule = { class = "Vlc" },
        properties = { floating = true }
    },

    {
        rule = { class = "Ekiga" },
        properties = { floating = true, tag = tags[4][1] }
    },

    {
        rule = { name = "Firefox Preferences" },
        properties = { floating = true }
    },

    {
        rule = { class = "VirtualBox" },
        properties = { tag = tags[2][1] }
    }
}
