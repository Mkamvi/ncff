require('lualine').setup {
  options = {
    theme = 'nightly'
  },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1,
      },
      'filesize',
    },
    lualine_z = { "os.date('%Y.%m.%d %X %p %A %j/366天')" }
  },
}
