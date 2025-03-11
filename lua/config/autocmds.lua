-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- 开启绝对行号
vim.opt.number = true
-- 全局默认缩进设置
vim.opt.expandtab = true -- 将 Tab 转换为空格
vim.opt.tabstop = 2 -- 一个 Tab 显示为 2 个空格
vim.opt.shiftwidth = 2 -- 自动缩进时使用 2 个空格
vim.opt.softtabstop = 2 -- 按退格键时删除 2 个空格

-- 根据文件类型设置缩进
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "java", "cpp" }, -- 针对 Python、Java、C++ 使用 4 个空格
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "lua", "ruby" }, -- 针对 JS、TS、Lua、Ruby 使用 2 个空格
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go", "make" }, -- 针对 Go 和 Makefile 使用 Tab
  callback = function()
    vim.opt_local.expandtab = false -- 使用 Tab 而不是空格
    vim.opt_local.tabstop = 4 -- 一个 Tab 显示为 4 个空格宽度
    vim.opt_local.shiftwidth = 4 -- 自动缩进时使用 4 个空格宽度
  end,
})
