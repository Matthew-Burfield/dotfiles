local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup {
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },

    mappings = {
    },
  },
}

require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")

local M = {}

M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = "$HOME/.config/nvim/",
    })
end

M.current_buffer_fuzzy_find = function()
	require("telescope.builtin").current_buffer_fuzzy_find({
		sorting_strategy="ascending"
	})
end

return M
