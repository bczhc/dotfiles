require("mime-ext"):setup {
    -- Expand the existing filename database (lowercase), for example:
    with_files = {
        makefile = "text/makefile",
        -- ...
    },

    -- Expand the existing extension database (lowercase), for example:
    with_exts = {
        mk = "text/makefile",
        -- ...
    },

    -- If the mime-type is not in both filename and extension databases,
    -- then fallback to Yazi's preset `mime` plugin, which uses `file(1)`
    fallback_file1 = false,
}

-- modified from https://github.com/sxyazi/yazi/blob/546920e0491975a8060f10f8cd5c8d401bbe3231/yazi-plugin/preset/components/status.lua#L121C1-L131C4
function Status:position()
    local cursor = self._current.cursor
    local length = #self._current.files
    local loaded = cx.active.current.stage()

    local style = self:style()
    local format
    if loaded then
        format = " %2d/%-2d "
    else
        format = " %2d/%-2d(?) "
    end
    return ui.Line {
        ui.Span(th.status.sep_right.open):fg(style.main.bg):bg(style.alt.bg),
        ui.Span(string.format(format, math.min(cursor + 1, length), length)):style(style.main),
        ui.Span(th.status.sep_right.close):fg(style.main.bg):bg("reset"),
    }
end
