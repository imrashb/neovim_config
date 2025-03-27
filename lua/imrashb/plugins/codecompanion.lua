return {
	"olimorris/codecompanion.nvim",
	config = function()
		require("codecompanion").setup({
			display = {
				action_palette = {
					width = 95,
					height = 10,
					prompt = "Prompt ", -- Prompt used for interactive LLM calls
					provider = "telescope", -- default|telescope|mini_pick
					opts = {
						show_default_actions = true, -- Show the default actions in the action palette?
						show_default_prompt_library = true, -- Show the default prompt library in the action palette?
					},
				},
				chat = {
					provider = "telescope", -- Set the provider to telescope for chat
				},
				inline = {
					provider = "telescope", -- Set the provider to telescope for inline assistant
				},
			},
			strategies = {
				chat = {
					streaming = true,
					roles = {
						llm = function(adapter)
							return "CodeCompanion (" .. adapter.formatted_name .. ")"
						end,
						user = "You",
					},
					slash_commands = {
						["file"] = {
							-- Location to the slash command in CodeCompanion
							callback = "strategies.chat.slash_commands.file",
							description = "Select a file using Telescope",
							opts = {
								provider = "telescope", -- Other options include 'default', 'mini_pick', 'fzf_lua', snacks
								contains_code = true,
							},
						},
						["buffer"] = {
							-- Location to the slash command in CodeCompanion
							callback = "strategies.chat.slash_commands.buffer",
							description = "Select a buffer using Telescope",
							opts = {
								provider = "telescope", -- Other options include 'default', 'mini_pick', 'fzf_lua', snacks
								contains_code = true,
							},
						},
						["fetch"] = {
							-- Location to the slash command in CodeCompanion
							callback = "strategies.chat.slash_commands.fetch",
							description = "Fetch URL contents using Telescope",
							opts = {
								provider = "telescope", -- Other options include 'default', 'mini_pick', 'fzf_lua', snacks
								contains_code = true,
							},
						},
						["help"] = {
							-- Location to the slash command in CodeCompanion
							callback = "strategies.chat.slash_commands.help",
							description = "Select help tags using Telescope",
							opts = {
								provider = "telescope", -- Other options include 'default', 'mini_pick', 'fzf_lua', snacks
								contains_code = true,
							},
						},
						["symbols"] = {
							-- Location to the slash command in CodeCompanion
							callback = "strategies.chat.slash_commands.symbols",
							description = "Select symbols using Telescope",
							opts = {
								provider = "telescope", -- Other options include 'default', 'mini_pick', 'fzf_lua', snacks
								contains_code = true,
							},
						},
						["terminal"] = {
							-- Location to the slash command in CodeCompanion
							callback = "strategies.chat.slash_commands.terminal",
							description = "Insert terminal output using Telescope",
							opts = {
								provider = "telescope", -- Other options include 'default', 'mini_pick', 'fzf_lua', snacks
								contains_code = true,
							},
						},
					},
				},
			},
		})
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
}
