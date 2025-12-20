require('bczhc-shared')

--function Linemode:custom()
--     mediainfo $@ | rg '^Duration .*: (.*$)' -r '$1' | head -n1
--local output = Command("echo"):args("a"):stdout(Command.PIPED):output()
--local f = tostring(output)
--return f
--end

local M = {}
function M:spot(job)
    local output = Command("echo"):args({ "a", "b" }):stdout(Command.PIPED):spawn():read_line()

    local rows = {}
    rows[#rows + 1] = ui.Row({ tostring(output), "" })

    ya.spot_table(
            job,
            ui.Table(rows)
              :area(ui.Pos { "center", w = 60, h = 20 })
              :row(1)
              :col(1)
              :col_style(th.spot.tbl_col)
              :cell_style(th.spot.tbl_cell)
              :widths { ui.Constraint.Length(14), ui.Constraint.Fill(1) }
    )
end

return M
