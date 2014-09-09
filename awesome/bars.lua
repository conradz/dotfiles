-- Config for the status bars on all screens

local awful = require("awful")
local wibox = require("wibox")

local bars = {}

local function select_client(c)
    c.minimized = false
    client.focus = c
    c:raise()
end

local task_buttons = awful.util.table.join(
    awful.button({}, 1, select_client)
)

for s = 1, screen.count() do
    local prompt = awful.widget.prompt()
    local layoutbox = awful.widget.layoutbox(s)
    local tags = awful.widget.taglist(s, awful.widget.taglist.filter.all)
    local tasks = awful.widget.tasklist(s,
        awful.widget.tasklist.filter.currenttags,
        task_buttons)
    local clock = awful.widget.textclock("   %H:%M   ")
    local box = awful.wibox({ position = "top", screen = s, height = 24 })

    local left = wibox.layout.fixed.horizontal()
    left:add(tags)
    left:add(prompt)

    local right = wibox.layout.fixed.horizontal()
    right:add(clock)
    right:add(layoutbox)

    local layout = wibox.layout.align.horizontal()
    layout:set_left(left)
    layout:set_middle(tasks)
    layout:set_right(right)

    box:set_widget(layout)

    bars[s] = {
        prompt = prompt,
        tags = tags,
        tasks = tasks
    }
end

return bars
