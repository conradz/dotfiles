local beautiful = require("beautiful")
beautiful.init("/home/conrad/.config/awesome/theme.lua")

local menubar = require("menubar")
local commands = require("commands")
menubar.utils.terminal = commands.terminal -- Set the terminal for applications that require it

local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")

require("errors")
require("tags")
require("backgrounds")
require("root_keys")
require("client_keys")
require("menu")
require("bars")
require("commands")
require("rules")
require("signals")
