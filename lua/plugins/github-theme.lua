require("github-theme").setup({
  theme_style = "dark",
  transparent = true,
  overrides = function(c)
    return {
      DashboardHeader = {
        fg = c.green
      },
      DashboardFooter = {
        fg = '#7c7f81'
      }
    }
  end
})
