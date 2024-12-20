vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

require("options")
require("keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

local plugins = {
	require("plugins.telescope"),
	require("plugins.nightfox"),
	require("plugins.vim-sleuth"),
	require("plugins.gitsigns"),
	require("plugins.which-key"),
	require("plugins.lualine"),
	require("plugins.lazydev"),
	require("plugins.luvit-meta"),
	require("plugins.nvim-lspconfig"),
	require("plugins.nvim-treesitter"),
	require("plugins.nvim-cmp"),
	require("plugins.nvim-autopairs"),
	require("plugins.oil"),
	require("plugins.conform"),
	require("plugins.nvim-lint"),
}

local options = {}

require("lazy").setup(plugins, options)

vim.cmd.colorscheme("nightfox")
