-- 展示行号
vim.opt.number = true
-- 相对行号
vim.opt.relativenumber = true

-- 24Bit颜色
vim.opt.termguicolors = true
-- 缩进宽度对齐到 shiftwidth 的整数倍
-- vim.opt.shiftround = true
-- 交换文件写入磁盘的更新时间
vim.opt.updatetime = 3000
-- 高亮光标行 试下Cmd + / 😍
-- vim.opt.cursorline = true
-- 自动写入
-- vim.opt.autowrite = true

-- tab
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
-- 允许使用鼠标(a: all)
vim.opt.mouse = ""
-- 替换tab
vim.opt.expandtab = true

vim.opt.list = true
vim.opt.listchars:append("eol:↴")
vim.opt.listchars:append("space:⋅")

-- 剪切板
vim.opt.clipboard = "unnamedplus"

-- 使用PowerShell
local powershell_options = {
  shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
  shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  shellquote = "",
  shellxquote = "",
}

if vim.loop.os_uname().sysname == "Windows_NT" then
  for option, value in pairs(powershell_options) do
    vim.opt[option] = value
  end
end
