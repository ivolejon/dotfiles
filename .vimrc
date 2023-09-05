set number relativenumber
set nu rnu

syntax on " Turn syntax highlighting on
set ai " Sets auto-indentation
set si " Sets smart-indentation
set noswapfile " Prevent vim from creating .swp files
set cursorline " Highlight current cursor line
" set cursorcolumn " Highlight current cursor column
set tabstop=2 " Tab equal 2 spaces (default 4)
set expandtab " Use spaces instead of a tab charater on TAB
set smarttab " Be smart when using tabs
set wrap " Wrap overflowing lines
set incsearch " When searching (/), display results as you type (instead of only upon ENTER)
set ignorecase " When searching (/), ignore case entirely
set smartcase " When searching (/), automatically switch to a case-sensitive search if you use any capital letters
set cmdheight=0 " Set height of the command bar to 2
set ttyfast " Boost speed by altering character redraw rates to your terminal
set noerrorbells " Silence the error bell
set encoding=utf8 " Set text encoding as utf8
set numberwidth=3 " Sets width of the 'gutter' column used for numbering to 3 (default 4)
set clipboard=unnamed " Use the OS clipboard by default
set noendofline " No end-of-line character


let mapleader = " " " map leader to Space
imap jj <Esc>
nnoremap <leader>ps :Telescope live_grep<cr>
nnoremap <C-p> :Telescope git_files<cr>
nnoremap <C-b> :Telescope buffers<cr>
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>
nnoremap <C-w> :bdelete<cr>
nnoremap - $
map <C-c> :Commentary<cr>
" Hard mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

call plug#begin()
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'itchyny/lightline.vim'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'github/copilot.vim'
Plug 'smolck/command-completion.nvim'
Plug 'echasnovski/mini.starter'
" LSP Support
Plug 'neovim/nvim-lspconfig'                           " Required
Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'} " Optional
Plug 'williamboman/mason-lspconfig.nvim'               " Optional

" Autocompletion
Plug 'hrsh7th/nvim-cmp'         " Required
Plug 'hrsh7th/cmp-nvim-lsp'     " Required
Plug 'L3MON4D3/LuaSnip'         " Required

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}
call plug#end()
lua <<EOF
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

require('command-completion').setup()
require('mini.starter').setup()
-- " (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

EOF

colorscheme tokyonight-night

" This changes the linenumber so it has to be ran aftar the theme
:highlight LineNr guifg=#FFFFCC
