syntax on
set nu
set encoding=UTF-8

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

call plug#begin('~/.vim/plugged')

Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-sleuth'
Plug 'psliwka/vim-smoothie'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'
Plug 'prashanthellina/follow-markdown-links'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'hzchirs/vim-material'
Plug 'neoclide/npm.nvim', {'do' : 'npm install'}

call plug#end()

set directory^=$HOME/.vim/tmp//

set background=light
colorscheme vim-material

let g:airline_theme='material'

let g:airline_powerline_fonts = 1
let NERDTreeShowHidden=1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
