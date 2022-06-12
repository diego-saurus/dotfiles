call plug#begin('~/.vim/plugged')
	" Linter
	" Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}
  let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-json',
  \]

  " Plug 'jiangmiao/auto-pairs'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  "Version Control System (GIT)
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  
  " Line
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  
  " Theme
  Plug 'sainnhe/sonokai'

  " Icon
  Plug 'ryanoasis/vim-devicons'
  Plug 'ap/vim-buftabline'

  " NERD
	Plug 'scrooloose/nerdtree'
  Plug 'preservim/nerdcommenter'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  " OTHERS
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 
  Plug 'christianfosli/wsl-copy'

call plug#end()
