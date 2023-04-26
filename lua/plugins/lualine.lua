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
      'filesize'
    },
  },
}
