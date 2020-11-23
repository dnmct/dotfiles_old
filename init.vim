call plug#begin(stdpath('data') . '/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tpope/vim-commentary'
Plug 'rstacruz/vim-closer'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
call plug#end()

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set list
set lcs=tab:┆·,trail:·
set splitbelow
set splitright

set hidden
set signcolumn=yes
set nowrap
set ignorecase
set number
set termguicolors
set noshowmode
set switchbuf=useopen
set noshowcmd
set noruler
set inccommand=split

set completeopt=menuone,noinsert,noselect
set shortmess+=c

:lua << EOF
  local nvim_lsp = require('nvim_lsp')
  local on_attach = function(_, bufnr)
    require('completion').on_attach()
    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>xD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>xr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>xd', '<cmd>lua vim.lsp.diagnostics.show_line_diagnostics()<CR>', opts)
  end
  local servers = {'jsonls', 'vimls', 'tsserver', 'cssls', 'html'}
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
    }
  end
EOF

let mapleader = " "
nnoremap <silent> <leader>n :noh<CR>

nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fm :Files!<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>fw :Ag! <C-R><C-W><CR>
nnoremap <leader>fh :History<CR>

nnoremap <leader>bd :bd<CR>

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
