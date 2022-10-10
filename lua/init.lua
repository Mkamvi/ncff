-- ---------------  基础  --------------------
-- 语法高亮
vim.cmd('syntax on')
-- 文件类型加载插件缩进
vim.cmd('filetype plugin indent on')
-- 展示行号
vim.opt.number = true
-- 相对行号
vim.opt.relativenumber = true
-- 24Bit颜色
vim.opt.termguicolors = true
-- 缩进宽度对齐到 shiftwidth 的整数倍
vim.opt.shiftround = true
-- 交换文件写入磁盘的更新时间
vim.opt.updatetime = 100
-- 高亮光标行
vim.opt.cursorline = true
-- 自动写入
vim.opt.autowrite = true
if (vim.fn.has('termguicolors') == 1) then
  vim.opt.termguicolors = true
end
-- tab
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
-- 允许使用鼠标(a: all)
vim.opt.mouse = 'i'
-- 替换tab
vim.opt.expandtab = true

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- 插件
require("core.plugins")
-- 快捷键
require("core.keymaps")
-- 主题
require("core.theme")

require("configs.filetree").config()
require("configs.bufferline").config()
require("configs.treesitter").config()
require("configs.git").config()
require("configs.statusline").config()
require("configs.terminal").config()
require("configs.theme").config()
require("configs.which-key").config()
-- require("configs.startscreen").config()

