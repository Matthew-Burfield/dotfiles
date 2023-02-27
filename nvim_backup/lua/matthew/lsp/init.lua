local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("matthew.lsp.mason")
require("matthew.lsp.lsp-installer")
require("matthew.lsp.handlers").setup()
