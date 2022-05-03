-- local utils = require("utils")

-- Automatically update plugins when this file changes
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- needed for automatic updates during fresh install
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup({
  function(use)
    use { 'lewis6991/impatient.nvim', config = [[require('config.impatient')]] }

    -- Packer can manage itself
    use {'wbthomason/packer.nvim'}

    -- we could replace this with nvim-lualine/lualine.nvim
    use 'bling/vim-airline'

    use({"onsails/lspkind-nvim", event = "VimEnter"})

    -- auto-completion engine
    use {"hrsh7th/nvim-cmp",
      after = "lspkind-nvim",
      config = [[require('config.nvim-cmp')]]
    }

    -- nvim-cmp completion sources
    use {"hrsh7th/cmp-nvim-lsp", after = "nvim-cmp"}
    use {"hrsh7th/cmp-nvim-lua", after = "nvim-cmp"}
    use {"hrsh7th/cmp-path", after = "nvim-cmp"}
    use {"hrsh7th/cmp-buffer", after = "nvim-cmp"}
    use {"quangnguyen30192/cmp-nvim-ultisnips", after = {"nvim-cmp", 'ultisnips'}}

    -- This instead of Coc.nvim
    use { "neovim/nvim-lspconfig",
      after = "cmp-nvim-lsp",
      config = [[require('config.lsp')]]
    }

    use { 'glepnir/lspsaga.nvim' }

    use {
      'nvim-treesitter/nvim-treesitter',
      event = 'BufEnter',
      run = ':TSUpdate',
      config = [[require('config.treesitter')]]
    }

    use {
      'nvim-telescope/telescope.nvim',
      cmd = 'Telescope',
      requires = {{'nvim-lua/plenary.nvim'}},
      config = [[require('config.telescope')]]
    }

    use {
      'nvim-telescope/telescope-fzf-native.nvim',
      requires = {{'nvim-telescope/telescope.nvim'}},
      run = 'make'
    }

    -- add indent object
    use { 'michaeljsmith/vim-indent-object', event = "VimEnter" }

    -- use { 'kyazdani42/nvim-web-devicons' }

    use {
      'kyazdani42/nvim-tree.lua',
      -- requires = {{'kyazdani42/nvim-web-devicons'}},
      config = [[require('config.nvim-tree')]]
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
        numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
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
        },
      } end
      -- tag = 'release' -- To use the latest release
    }

    use { "$HOME/.config/nvim/pack/dracula_pro", opt = true }

    use ({"SirVer/ultisnips", event = "InsertEnter"})
    use ({"honza/vim-snippets", after = "ultisnips"})
    -- debugging tool for Jest tests
    use ({ 'David-Kunz/jester', require = 'nvim-treesitter', event = "VimEnter" })
    use 'github/copilot.vim'

    use ({"tpope/vim-commentary", event = "VimEnter"})
    use ({'tpope/vim-surround'})
    use 'tpope/vim-unimpaired'
    use ({'tpope/vim-repeat', event = "VimEnter"})
    use 'wellle/targets.vim'
    use 'jiangmiao/auto-pairs'

    use 'mattn/emmet-vim'

    if packer_bootstrap then
      require('packer').sync()
    end
  end
});

