
-- leader ^-^
vim.g.mapleader = ';'

-- LazyGit
local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  count = 5,
  direction = "float",
  float_opts = {
    border = "double"
  }
})

-- NvimTree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>')
vim.keymap.set('n', '<leader>ef', ':NvimTreeFocus<cr>')

-- Telescope
-- vim.keymap.set('n', '<leader>ff', function()
--   require'telescope.builtin'.find_files {}
-- end)
-- vim.keymap.set('n', '<leader>gf', function()
--   require'telescope.builtin'.git_files {}
-- end)
-- vim.keymap.set('n', '<leader>bf', function()
--   require'telescope.builtin'.buffers {}
-- end)

-- window resize
vim.keymap.set('n', '<leader>wx', ':x<cr>')
vim.keymap.set('n', '-', ':sp<cr>')
vim.keymap.set('n', '|', ':vs<cr>')
vim.keymap.set('n', '<S-Left>', '<c-w><')
vim.keymap.set('n', '<S-Right>', '<c-w>>')
vim.keymap.set('n', '<S-Down>', '<c-w>-')
vim.keymap.set('n', '<S-Up>', '<c-w>+')

-- p: plugins
vim.keymap.set('n', '<leader>pi', ':PackerInstall<cr>')
vim.keymap.set('n', '<leader>pc', ':PackerClean<cr>')

-- t: terminal
vim.keymap.set('t', '<C-g>', '<C-\\><C-n>')

-- h: git
vim.keymap.set('n', '<leader>hs', '::Gitsigns stage_hunk<cr>')
vim.keymap.set('n', '<leader>hu', ':Gitsigns undo_stage_hunk<cr>')
vim.keymap.set('n', '<leader>hn', ':Gitsigns next_hunk<cr>')
vim.keymap.set('n', '<leader>hc', ':Gitsigns preview_hunk<cr>')
vim.keymap.set('n', '<leader>hr', ':Gitsigns reset_hunk<cr>')
vim.keymap.set('n', '<leader>hb', ':Gitsigns blame_line<cr>')
vim.keymap.set('n', '<leader>hd', ':Gitsigns diffthis<cr>')
vim.keymap.set('n', '<leader>g', function()
  lazygit:toggle()
end, {
  noremap = true,
  silent = true
})

-- Tabs
vim.keymap.set('n', ']b', ':bnext<CR>')
vim.keymap.set('n', '[b', ':bprev<CR>')
vim.keymap.set('n', '<leader>q', ':Bdelete<cr>') -- 删除tab(bufferline)
vim.keymap.set('n', '<leader>aq', ':bufdo :Bdelete<cr>') -- 删除tab(bufferline)
vim.keymap.set('n', '<leader>aa', ':quitall<cr>') -- 删除tab(bufferline)
vim.keymap.set('n', '<leader>1', function() require("bufferline").go_to_buffer(1, true) end)
vim.keymap.set('n', '<leader>2', function() require("bufferline").go_to_buffer(2, true) end)
vim.keymap.set('n', '<leader>3', function() require("bufferline").go_to_buffer(3, true) end)
vim.keymap.set('n', '<leader>4', function() require("bufferline").go_to_buffer(4, true) end)
vim.keymap.set('n', '<leader>5', function() require("bufferline").go_to_buffer(5, true) end)
vim.keymap.set('n', '<leader>6', function() require("bufferline").go_to_buffer(6, true) end)
vim.keymap.set('n', '<leader>7', function() require("bufferline").go_to_buffer(7, true) end)
vim.keymap.set('n', '<leader>8', function() require("bufferline").go_to_buffer(8, true) end)
vim.keymap.set('n', '<leader>9', function() require("bufferline").go_to_buffer(9, true) end)
vim.keymap.set('n', '<leader>-1', function() require("bufferline").go_to_buffer(-1, true) end)

-- 编辑
vim.keymap.set('i', '<C-s>', '<ESC>:w<CR>')
vim.keymap.set('n', '<leader>f', '<ESC>:Format<CR>')
vim.keymap.set('n', '<C-s>', '<ESC>:w<CR>')
vim.keymap.set('n', '<C-l>', ':set invrelativenumber<cr>')

-- 全局替换
vim.keymap.set('n', '<leader>S', require('spectre').open)

-- Hop
vim.keymap.set('n', '<leader>l', ':HopLine<CR>')
vim.keymap.set('n', '<leader>w', ':HopWord<CR>')
vim.keymap.set('n', '<leader>lw', ':HopWordCurrentLine<CR>')

-- hlslens
vim.keymap.set('n', '<leader>ns', '<Cmd>noh<CR>')

-- DAP
vim.keymap.set('n', '<leader>db', function ()
  -- require'dap'.continue() 
end)
vim.keymap.set('n', '<leader>dbs', function ()
  -- require'dap'.toggle_breakpoint()
end)


vim.keymap.set('n', '<leader>td', function ()
  vim.cmd('colorscheme github_dark_default')
end)

vim.keymap.set('n', '<leader>tl', function ()
  vim.cmd('colorscheme github_light')
end)

-- Trouble
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
