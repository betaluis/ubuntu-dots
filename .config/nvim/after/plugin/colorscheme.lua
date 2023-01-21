-- local colorsceme = "gruvbox"
-- 
-- -- vim.o.background = "dark"
-- local status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not status then
--     vim.notify("colorscheme " .. colorscheme .. " not found!")
--     return
-- end

function ColorPencils(color)
    color = color or "gruvbox"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorPencils()
