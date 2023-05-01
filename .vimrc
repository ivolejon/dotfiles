:set number relativenumber
:set nu rnu
:set wildmenu
:set wildmode=longest:full,full
:set wildoptions=pum


let mapleader = " " " map leader to Space
imap jj <Esc>
nnoremap <leader>ps <cmd>Telescope live_grep<cr>
nnoremap <C-p> <cmd>Telescope git_files<cr>
nnoremap <C-b> <cmd>Telescope buffers<cr>
nnoremap <Leader>w :Bdelete<CR>
call plug#begin()
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

colorscheme tokyonight

" This changes the linenumber so it has to be ran aftar the theme
:highlight LineNr guifg=#FFFFCC
