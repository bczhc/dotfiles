--- @sync entry
return {
    entry = function(_, _)
        Status:children_add(function()
            local loaded = cx.active.current.stage()
            return string.format(" %s ", loaded and "Loaded" or "Loading")
        end, 500, Status.RIGHT)
    end
}
