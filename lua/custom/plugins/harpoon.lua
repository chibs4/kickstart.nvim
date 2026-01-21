return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope.nvim' },
	config = function()
		local harpoon = require('harpoon')
		harpoon:setup({})

		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers").new({}, {
				prompt_title = "Harpoon",
				finder = require("telescope.finders").new_table({
					results = file_paths,
				}),
				previewer = conf.file_previewer({}),
				sorter = conf.generic_sorter({}),
			}):find()
		end
		-- keybindings
		vim.keymap.set("n", "<leader>h", function() toggle_telescope(harpoon:list()) end,
			{ desc = "Open harpoon window" })

		vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Add to harpoon" })

		for key = 1, 9 do
			vim.keymap.set("n", "<leader>" .. key, function() harpoon:list():select(key) end,
				{ desc = "Open harpoon window " .. key })
		end
	end
}
