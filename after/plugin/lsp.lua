local Remap = require("angel.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

require("mason").setup()
require("mason-lspconfig").setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
--
-- Setup nvim-cmp.
local cmp = require("cmp")
local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}
local lspkind = require("lspkind")

cmp.setup({
	snippet = {
		expand = function(args)
			-- For `vsnip` user.
			-- vim.fn["vsnip#anonymous"](args.body)

			-- For `luasnip` user.
			require("luasnip").lsp_expand(args.body)

			-- For `ultisnips` user.
			-- vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
	}),

	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind]
			local menu = source_mapping[entry.source.name]
			if entry.source.name == "cmp_tabnine" then
				if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
					menu = entry.completion_item.data.detail .. " " .. menu
				end
				vim_item.kind = ""
			end
			vim_item.menu = menu
			return vim_item
		end,
	},

	sources = {
		-- tabnine completion? yayaya

		{ name = "cmp_tabnine" },

		{ name = "nvim_lsp" },

		-- For luasnip user.
		{ name = "luasnip" },

		{ name = "buffer" },

		{ name = "youtube" },
	},
})

local tabnine = require("cmp_tabnine.config")
tabnine:setup({
	max_lines = 1000,
	max_num_results = 20,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = "..",
})

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function()
			nnoremap("gd", function() vim.lsp.buf.definition() end)
			nnoremap("gi", function() vim.lsp.buf.implementation() end)
			nnoremap("gr", function() require('telescope.builtin').lsp_references() end)
			nnoremap("K", function() vim.lsp.buf.hover() end)
			nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
			nnoremap("<leader>e", function() vim.diagnostic.open_float() end)
			nnoremap("<leader>k", function() vim.diagnostic.goto_next() end)
			nnoremap("<leader>j", function() vim.diagnostic.goto_prev() end)
			nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end)
			nnoremap("<leader>vco", function() vim.lsp.buf.code_action({
                filter = function(code_action)
                    if not code_action or not code_action.data then
                        return false
                    end

                    local data = code_action.data.id
                    return string.sub(data, #data - 1, #data) == ":0"
                end,
                apply = true
            }) end)
			nnoremap("<leader>vrr", function() vim.lsp.buf.references() end)
			nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end)
			--inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
		end,
	}, _config or {})
end

--require("lspconfig").clangd.setup(config())

require("lspconfig").ccls.setup(config({
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cu', 'cuda' },
}))

require("lspconfig").tsserver.setup(config())

require("lspconfig").pyright.setup(config())

require("lspconfig").rust_analyzer.setup({})

--require('arduino').configured

--require('arduino').setup{
    --default_fqbn = "arduino:avr:uno",

    ----Path to clangd (all paths must be full)
    --clangd = "/bin/clangd",

    ----Path to arduino-cli
    --arduino = "/home/angelk/Arduino/bin/arduino-cli",

    ----Data directory of arduino-cli
    --arduino_config_dir = "/home/angelk/.arduino15/arduino-cli.yaml",

    ----Extra options to arduino-language-server
    ----extra_opts = { ... }
--}

--require("lspconfig").arduino_laguage_server.setup({
    --on_new_config = arduino.on_new_config,
--})
require("lspconfig").arduino_language_server.setup{
    on_new_config = require("arduino").on_new_config
}

