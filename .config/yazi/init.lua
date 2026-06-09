require("mime-ext"):setup {
	with_files = {
		makefile = "text/makefile",
	},
	with_exts = {
		mk = "text/makefile",
	},
	fallback_file1 = false,
}

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
		ui.Span(th.status.sep_right.open):fg(style.main:bg()):bg(style.alt:bg()),
		ui.Span(string.format(format, math.min(cursor + 1, length), length)):style(style.main),
		ui.Span(th.status.sep_right.close):fg(style.main:bg()):bg(App.bg()),
	}
end

require("git"):setup()
require('bczhc-custom')
