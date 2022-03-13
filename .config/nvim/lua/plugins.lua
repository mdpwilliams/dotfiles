-- Automatically update plugins when this file changes
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use { '$HOME/.config/nvim/pack/dracula_pro' }
  use 'bling/vim-airline'

  use {
    'neoclide/coc.nvim',
    branch = 'release',
    run = ':CocUpdate',
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require'nvim-treesitter.configs'.setup {
      ensure_installed = 'maintained',
    } end
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/plenary.nvim'},
  }
}
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {{'kyazdani42/nvim-web-devicons'}},
    config = function() require'nvim-tree'.setup {
      disable_netrw        = false,
      hijack_netrw         = true,
      open_on_setup        = false,
      ignore_buffer_on_setup = false,
      ignore_ft_on_setup   = {},
      auto_close           = false,
      auto_reload_on_write = true,
      open_on_tab          = false,
      hijack_cursor        = false,
      update_cwd           = false,
      hijack_unnamed_buffer_when_opening = false,
      hijack_directories   = {
        enable = true,
        auto_open = true,
      },
      diagnostics = {
        enable = false,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        }
      },
      update_focused_file = {
        enable      = false,
        update_cwd  = false,
        ignore_list = {}
      },
      system_open = {
        cmd  = nil,
        args = {}
      },
      filters = {
        dotfiles = false,
        custom = {}
      },
      git = {
        enable = true,
        ignore = true,
        timeout = 500,
      },
      view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = 'left',
        preserve_window_proportions = false,
        mappings = {
          custom_only = false,
          list = {}
        },
        number = false,
        relativenumber = false,
        signcolumn = "yes"
      },
      trash = {
        cmd = "trash",
        require_confirm = true
      },
      actions = {
        change_dir = {
          enable = true,
          global = false,
        },
        open_file = {
          quit_on_open = false,
          resize_window = false,
          window_picker = {
            enable = true,
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            exclude = {
              filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", },
              buftype  = { "nofile", "terminal", "help", },
            }
          }
        }
      },
      log = {
        enable = false,
        truncate = false,
        types = {
          all = false,
          config = false,
          git = false,
        },
      },
    } end
  }

  use 'tpope/vim-fugitive'

  use {
    'lewis6991/gitsigns.nvim',
    requires = {{'nvim-lua/plenary.nvim'}},
    config = function() require'gitsigns'.setup {
      signs = {
        add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
      },
      signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
      numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff  = fase, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        interval = 1000,
        follow_files = true
      },
      attach_to_untracked = true,
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000,
      preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
      },
      yadm = {
        enable = false
      },l
    } end
    -- tag = 'release' -- To use the latest release
  }
  -- use 'mhinz/vim-signify'

  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'wellle/targets.vim'
  use 'jiangmiao/auto-pairs'

  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  use 'github/copilot.vim'

  use 'mattn/emmet-vim'

end);

