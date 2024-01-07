
local wk = require("which-key")

wk.register({
  ["<Leader>"] = {
    c = {
      name = " □  Boxes",
      b = { "<Cmd>CBccbox<CR>", "Box Title" },
      t = { "<Cmd>CBccline<CR>", "Titled Line" },
      l = { "<Cmd>CBline<CR>", "Simple Line" },
      m = { "<Cmd>CBccbox14<CR>", "Marked" },
      d = { "<Cmd>CBd<CR>", "Remove a box" },
    },
  },
})
