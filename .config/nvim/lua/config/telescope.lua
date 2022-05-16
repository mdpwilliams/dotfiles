local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup{
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      height = 0.80
    },
    file_ignore_patterns = {"node_modules"},
    mappings = {
      n = {
        ["q"] = actions.close
      }
    }
  },
  pickers = {

  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",
    }
  }
}

telescope.load_extension('fzf')
