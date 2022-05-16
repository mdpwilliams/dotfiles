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

    use {
      'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons'},
      config = [[require('config.lualine')]]
    }

    use({
      "onsails/lspkind-nvim",
      config = [[require('config.lspkind')]],
      event = "VimEnter",
    })

    use {'kyazdani42/nvim-web-devicons'}

    -- auto-completion engine
    use {"hrsh7th/nvim-cmp",
      after = "lspkind-nvim",
      requires = {'kyazdani42/nvim-web-devicons'},
      config = [[require('config.nvim-cmp')]]
    }

    -- nvim-cmp completion sources
    use {"hrsh7th/cmp-nvim-lsp", after = "nvim-cmp"}
    use {"hrsh7th/cmp-nvim-lua", after = "nvim-cmp"}
    use {"hrsh7th/cmp-path", after = "nvim-cmp"}
    use {"hrsh7th/cmp-buffer", after = "nvim-cmp"}
    use {"hrsh7th/cmp-copilot", after = "nvim-cmp"}
    use {"quangnguyen30192/cmp-nvim-ultisnips", after = {"nvim-cmp", 'ultisnips'}}

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
      config = [[require('config.telescope')]],
      requires = {{'nvim-lua/plenary.nvim'}}
    }

    use {
      'burntsushi/ripgrep',
      requires = {{'nvim-telescope/telescope.nvim'}}
    }

    use {
      'nvim-telescope/telescope-fzf-native.nvim',
      requires = {{'nvim-telescope/telescope.nvim'}},
      run = 'make'
    }

    -- add indent object
    use { 'michaeljsmith/vim-indent-object', event = "VimEnter" }

    use {
      'kyazdani42/nvim-tree.lua',
      requires = {'kyazdani42/nvim-web-devicons'},
      config = [[require('config.nvim-tree')]]
    }

    use 'tpope/vim-fugitive'

    use {
      'lewis6991/gitsigns.nvim',
      requires = {{'nvim-lua/plenary.nvim'}},
      config = [[require('config.git-signs')]]
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

