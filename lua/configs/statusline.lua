local M = {}
function M.config()
  require('lualine').setup {
    sections = {
      lualine_c = {
        {
          'filename',
           path = 1,
        },
        'filesize'
      },
    },
  }
end

return M
