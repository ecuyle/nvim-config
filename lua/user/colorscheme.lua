-- tokyonight
-- local colorscheme = "onedark"

vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_better_performance = 1
local colorscheme = "gruvbox-material"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
