vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fd", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>fs", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

--local harpoon = require("harpoon")
--harpoon.setup()


