local colorscheme = "ecmax"
local test = "hello world"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end

if colorscheme == "gruvbox-material" then
	vim.g.gruvbox_material_better_performance = 1
end

if colorscheme == "rose-pine" then
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "Insert", { bg = "none" })
	vim.api.nvim_set_hl(0, "InsertFloat", { bg = "none" })
end
