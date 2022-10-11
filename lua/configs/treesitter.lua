local M = {}
function M.config()
  -- nvim-treesitter config
  require'nvim-treesitter.configs'.setup {
    -- ensure_installed = "maintained", -- for installing all maintained parsers
    ensure_installed = {"c", "cpp", "rust", "lua", 'css', 'html', 'javascript', 'jsdoc', 'json', 'lua', 'markdown',
                        'php', 'python', 'scss', 'tsx', 'typescript'}, -- for installing specific parsers
    sync_install = true, -- install synchronously
    ignore_install = {}, -- parsers to not install
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false -- disable standard vim highlighting
    },
    autotag = {
      enable = true,
    },
    rainbow = {
      enable = true,
      -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- Do not enable for files with more than n lines, int
      -- colors = {}, -- table of hex strings
      -- termcolors = {} -- table of colour name strings
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    }
  }
end

return M
