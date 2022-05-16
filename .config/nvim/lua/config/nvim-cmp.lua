local cmp = require'cmp'
local lspkind = require'lspkind'

cmp.setup({
  snippet = {
    expand = function(args)
      vm.fn["UltiSnips#Anon"](args.body)
    end,
  },
  view = {
    entries = { name = 'custom', selection_order = 'near_cursor' }
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-n>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        return cmp.select_next_item()
      end
      fallback()
    end, { 'i', 'c' }),
    ['<C-p>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        return cmp.select_prev_item()
      end
      fallback()
    end, { 'i', 'c' }),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources(
    {
      { name = 'nvim_lsp' },
      { name = 'ultisnips' },
    },
    {
      { name = 'copilot' },
    },
    {
      { name = 'buffer' },
    }),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 50
    })
  }
})

vim.cmd [[highlight! default link CmpItemKind CmpItemMenuDefault]]
