-- Display errors
local naughty = require("naughty")

local function show_error(title, err)
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = title,
        text = err
    })
end

local in_error = false
local function runtime_error(err)
    if in_error then return end
    in_error = true
    show_error("Runtime error", err)
    in_error = false
end

-- Show startup errors
if awesome.startup_errors then
    show_error("Startup error", awesome.startup_errors)
end

-- Show runtime errors
awesome.connect_signal("debug::error", runtime_error)
