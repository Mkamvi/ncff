
-- 语法高亮
vim.cmd('syntax on')
-- 文件类型加载插件缩进
vim.cmd('filetype plugin indent on')

-- 按照缩进折叠
vim.cmd [[ set fdm=indent]]
vim.cmd [[ set foldlevelstart=99]]
require('plugins.nightly-theme')
vim.cmd "colorscheme nightly"
