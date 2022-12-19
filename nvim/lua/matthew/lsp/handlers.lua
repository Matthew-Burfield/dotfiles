local M = {}

local cmp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_status_ok then
	return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

-- TODO: backfill this to template
M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_keymaps(bufnr)
	local nmap = function(keys, func, desc)
		local keymap = vim.api.nvim_buf_set_keymap
		if desc then
			desc = "LSP: " .. desc
		end
		keymap(bufnr, "n", keys, func, { noremap = true, silent = true, desc = desc })
	end
	nmap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", "[R]e[n]ame")
	nmap("<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", "[C]ode [A]ction")

	nmap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>", "[G]oto [D]efinition")
	nmap("gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", "[G]oto [R]eferences")
	nmap("gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", "[G]oto [I]mplementation")
	nmap("<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type [D]efinition")
	nmap("<leader>ds", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", "[D]ocument [S]ymbols")
	nmap(
		"<leader>ws",
		"<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>",
		"[W]orkspace [S]ymbols"
	)

	-- See `:help K` for why this keymap
	nmap("K", "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover Documentation")
	nmap("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Documentation")

	nmap("]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>')
	nmap("[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>')
	nmap("gl", "<cmd>lua vim.diagnostic.open_float<CR>")
	nmap("<leader>q", "<cmd>lua vim.diagnostic.setloclist<CR>")
end

M.on_attach = function(client, bufnr)
	if client.name == "typescript" then
		-- Don't use formatting for typescript, because we'll use prettier instead
		client.resolved_capabilities.document_formatting = false
	end

	if client.name == "sumneko_lua" then
		client.server_capabilities.documentFormattingProvider = false
	end

	lsp_keymaps(bufnr)

	local illuminate_status_ok, illuminate = pcall(require, "illuminate")
	if not illuminate_status_ok then
		return
	end

	illuminate.on_attach(client)
end

return M
