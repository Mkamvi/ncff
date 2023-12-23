require('lualine').setup {
  options = {
    theme = 'catppuccin'
  },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1,
      },
      'filesize',
    },
    lualine_z = { "os.date('%Y.%m.%d %X')" }
  },
}
