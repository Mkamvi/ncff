local M = {}
function M.config()
  require("github-theme").setup({
    theme_style = "dark",
    transparent = true
  })
end

return M
