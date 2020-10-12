call plug#begin(stdpath('data') . '/plugged')

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'tjdevries/express_line.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'morhetz/gruvbox'

call plug#end()




lua require'express_line'


source $HOME/.config/nvim/basic.vim
source $HOME/.config/nvim/colorscheme.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/completion.vim
source $HOME/.config/nvim/lsp.vim

