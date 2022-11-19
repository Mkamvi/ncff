-- leader ^-^
vim.g.mapleader = ';'

local function set_bg_light()
  -- vim.cmd('set background=light')
  vim.cmd('colorscheme github_light')
  -- vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]
  -- vim.cmd[[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]
end
local function set_bg_dark()
  -- vim.cmd('set background=dark')
  vim.cmd('colorscheme github_dark')
  -- vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]
  -- vim.cmd[[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]
end
local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  count = 2,
  direction = "float",
  float_opts = {
    border = "double"
  }
})

-- 主题
vim.keymap.set('n', '<leader>bgl', set_bg_light)
vim.keymap.set('n', '<leader>bgd', set_bg_dark)

-- NvimTree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>')
vim.keymap.set('n', '<leader>ef', ':NvimTreeFocus<cr>')

-- Telescope
vim.keymap.set('n', '<leader>ff', function()
  require'telescope.builtin'.find_files {}
end)
vim.keymap.set('n', '<leader>gf', function()
  require'telescope.builtin'.git_files {}
end)
vim.keymap.set('n', '<leader>bf', function()
  require'telescope.builtin'.buffers {}
end)

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

-- s: search
vim.keymap.set('n', '<leader>le', ':Lspsaga show_line_diagnostics<cr>')
vim.keymap.set('n', '<leader>lE', ':Lspsaga show_cursor_diagnostics<cr>')
vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist)
vim.keymap.set('n', '<leader>lk', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>ld', ':Lspsaga preview_definition<cr>')
vim.keymap.set('n', '<leader>lr', ':Lspsaga rename<cr>')
vim.keymap.set('n', '<leader>lh', vim.lsp.buf.signature_help)
vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.formatting)
vim.keymap.set('n', '<leader>lb', ':SymbolsOutline<cr>')
vim.keymap.set('n', '<leader>la', ':Lspsaga code_action<cr>')
vim.keymap.set('n', '<leader>lu', ':Lspsaga lsp_finder<cr>')
vim.keymap.set('n', '<F12>', ':Lspsaga code_action<cr>')
vim.keymap.set('n', '<leader>it', function()
  require('rust-tools.inlay_hints').toggle_inlay_hints()
end)
vim.keymap.set('n', '<leader>is', function()
  require('rust-tools.inlay_hints').set_inlay_hints()
end)
vim.keymap.set('n', '<leader>id', function()
  require('rust-tools.inlay_hints').diable_inlay_hints()
end)
vim.keymap.set('n', '<f4>', ':SymbolsOutline<cr>')

vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration)
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition)
vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation)
vim.keymap.set('n', '<leader>gp', ':Lspsaga diagnostic_jump_prev<cr>')
vim.keymap.set('n', '<leader>gn', ':Lspsaga diagnostic_jump_next<cr>')
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references)

vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder)
vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder)
vim.keymap.set('n', '<leader>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end)

-- t: terminal
-- use <f5> to toggle terminal, this can be set in lua/configs/terminal.lua
-- the default position is also set in lua/configs/terminal.lua
vim.keymap.set('t', '<C-g>', '<C-\\><C-n>')
vim.keymap.set('n', '<leader>tt', ':ToggleTerm direction=tab<cr>')
vim.keymap.set('n', '<leader>tn', function()
  Terminal:new():toggle()
end)
vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<cr>')
vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<cr>')
vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical<cr>')

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
vim.keymap.set('n', 'b]', ':bnext<CR>')
vim.keymap.set('n', 'b[', ':bprev<CR>')
vim.keymap.set('n', '<leader>q', ':Bdelete<cr>') -- 删除tab(bufferline)
vim.keymap.set('n', '<leader>aq', ':bufdo :Bdelete<cr>') -- 删除tab(bufferline)
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
vim.keymap.set('n', '<leader>f', '<ESC>:Prettier<CR>')
vim.keymap.set('n', '<C-s>', '<ESC>:w<CR>')
-- vim.keymap.set('n', '<leader>l', line_number_toogle)


-- nvim-spectre
-- nnoremap <leader>S <cmd>lua require('spectre').open()<CR>
vim.keymap.set('n', '<leader>S', require('spectre').open)
