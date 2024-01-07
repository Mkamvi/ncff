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
		p = {
			name = "Persistence",
			s = { [[<cmd>lua require("persistence").load()<cr>]], "Restore session for the current directory" },
			l = { [[<cmd>lua require("persistence").load({ last = true })<cr>]], "restore last session" },
			d = { [[<cmd>lua require("persistence").stop()<cr>]], "Session won't be saved on exit" },
		},
	},
})
