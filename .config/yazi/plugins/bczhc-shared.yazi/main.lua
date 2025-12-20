-- namespace for the shared library
local bc = {}

function bc.trim_end(str)
    return (string.gsub(str, "[\r\n ]+$", ""))
end

_G.bc = bc
return {}
