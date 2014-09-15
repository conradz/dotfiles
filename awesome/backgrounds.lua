-- Set the backgrounds for all the screens

local gears = require("gears")

local pictures = "/home/conrad/Pictures/"
local backgrounds = {
    pictures .. "background-1.png",
    pictures .. "background-2.png",
    pictures .. "background-3.png",
    pictures .. "background-3.jpg"
}

for i, bg in ipairs(backgrounds) do
    gears.wallpaper.maximized(bg, i, nil)
end

return backgrounds
