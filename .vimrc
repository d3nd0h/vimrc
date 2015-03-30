""""""""""""""""""""""""""""""""""""""""""""
" Vim Settings
""""""""""""""""""""""""""""""""""""""""""""
colorscheme clearance

" set below font after install the patched fonts @line 158
" set guifont=Ubuntu\ Mono\ derivative\ Powerline\ Plus\ Nerd\ File\ Types\ Mono\ 13
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11
set tabstop=4					" Set tab size to 4
set nocompatible				" be improved, required
set number						" turn on number lines
set showcmd						" show command on pressing keystrokes
set autoindent					" enables auto indentation
set ruler						" enables rule<LeftMouse>
set nowrap						" don't wrap lines
set autoindent					" always set autoindenting on
set copyindent					" copy the previous indentation on autoindenting
set shiftwidth=4				" number of spaces to use for autoindenting
set encoding=utf-8
set linespace=2					" space between lines
set hlsearch					" highlight search terms
set hidden						" Do not delete undo history when switching between buffers
set nobackup
set noswapfile
set guioptions -=T		 		" remove toolbar on gvim
set guioptions -=r  			" remove right-hand scroll bar
set guioptions -=L  			" remove left-hand scroll bar
set guioptions -=m  			" remove menu bar
set guioptions -=M 				" remove menu bar
set completeopt-=preview		" remove window information hint (on top of main window) after we use tab when autocomplete pops out

filetype off				  	" required

autocmd FileType html :setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript :setlocal shiftwidth=2 tabstop=2

" automatically trim trailing space everytime we save
autocmd BufWritePre * :%s/\s\+$//e

" Change cursor color to white
highlight Cursor guibg=white

" Change cursor color to green when in insert mode
au InsertLeave * hi Cursor guibg=white
au InsertEnter * hi Cursor guibg=green

if !has('gui_running')
	set t_Co=256
endif


""""""""""""""""""""""""""""""""""""""""""""
"MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""

" Press F3 to check current element highlight-group
map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

nnoremap QQ :MBEbd <CR>
nnoremap 1`` :b 1 <cR>
nnoremap 2`` :b 2 <CR>
nnoremap 3`` :b 3 <CR>
nnoremap 4`` :b 4 <CR>
nnoremap 5`` :b 5 <CR>
nnoremap 6`` :b 6 <CR>
nnoremap 7`` :b 7 <CR>
nnoremap 8`` :b 8 <CR>
nnoremap 9`` :b 9 <CR>
inoremap <C-[> <Esc><Esc><Esc><Esc>

" Press F5 to open a list of opened buffers and press <Enter> to open it
nnoremap <F5> :buffers<CR>:buffer<Space>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>sv :so ~/.vimrc<CR>

" Ctrl + L || Ctrl + H to scroll horizontally
nmap <C-L> 5zl
nmap <C-H> 5zh

" Ctrl+c = copy | Ctrl+v = paste
" Only works in visual and insert mode to avoid conflict to visual-block key
" <C-v> in normal mode
vmap <C-c> "+y
vmap <C-x> "+d
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Mapping to move lines
" The command :m .+1 (which can be abbreviated to :m+)
" moves the current line to after line number .+1 (current line number + 1).
" That is, the current line is moved down one line.
" The command :m .-2 (which can be abbreviated to :m-2)

" moves the current line to after line number .-2 (current line number − 2).
" That is, the current line is moved up one line.

" After visually selecting some lines, entering :m '>+1
" moves the selected lines to after line number '>+1 (one line after the last selected line;
" '> is a mark assigned by Vim to identify the selection end).
" That is, the block of selected lines is moved down one line.

" The == re-indents the line to suit its new position.
" For the visual-mode mappings, gv reselects the last visual block and = re-indents that block.
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

nnoremap <F6> :NumbersToggle<CR>
nnoremap <F7> :NumbersOnOff<CR>



""""""""""""""""""""""""""""""""""""""""""""
" Load Plugins
""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim 			" set the runtime path to include Vundle and initialize
call vundle#begin() 						" alternatively, pass a path where Vundle should install plugins
											" call vundle#begin('~/some/path/here')

"YouCompleteMe only works in linux/Mac OSX
if has('unix')
	Plugin 'Valloric/YouCompleteMe' 		" auto popup for autocomplete, without this we need to press <Ctrl+x+o>
endif

Plugin 'gmarik/Vundle.vim' 						" let Vundle manage Vundle, required
Plugin 'flazz/vim-colorschemes' 				" vim colorschemes
Plugin 'fatih/vim-go' 							" Go programming language
Plugin 'bling/vim-airline'						" Beautiful status bars
Plugin 'fholgado/minibufexpl.vim'				" Using it for deleting buffer fastly
Plugin 'kien/ctrlp.vim'							" Fast file finder just like sublime ctrl+p
Plugin 'scrooloose/nerdtree' 					" Plugin for listing directory structure
Plugin 'scrooloose/nerdcommenter' 				" Commenter
Plugin 'majutsushi/tagbar' 						" Plugin for showing functions and vars description
Plugin 'tpope/vim-fugitive' 					" Plugin for git inside vim
Plugin 'scrooloose/syntastic' 					" Plugin for error highlighter
Plugin 'Townk/vim-autoclose' 					" Plugin for autoclose brace () {}
Plugin 'terryma/vim-multiple-cursors' 			" Multiple selection just like in sublime Ctrl + d selection
Plugin 'jelera/vim-javascript-syntax'			" Javascript indentation + Syntax
Plugin 'othree/javascript-libraries-syntax.vim' " Javascript syntax for libs
Plugin 'godlygeek/tabular'						" Automatic alignment
Plugin 'SirVer/ultisnips'						" Code snippets
Plugin 'shawncplus/phpcomplete.vim'				" PHP completion
Plugin 'cespare/vim-toml'						" TOML syntax highlighting
Plugin 'plasticboy/vim-markdown'				" Markdown
Plugin 'mattn/emmet-vim'						" Emmet plugin
Plugin 'gregsexton/MatchTag'					" Highlight matched tag
Plugin 'tmhedberg/matchit'						" Jump between matched tags
Plugin 'phildawes/racer'						" Rust auto completer
Plugin 'wting/rust.vim'							" Rust syntax highlighting
Plugin 'myusuf3/numbers.vim'					" Relative number line
Plugin 'tpope/vim-surround'						" Insert text in surrounding selected text
Plugin 'groenewege/vim-less'          			" Less syntax highlighting

" If error with airline, reinstall airline to fix
" Clone https://github.com/ryanoasis/nerd-filetype-glyphs-fonts-patcher first
" Copy fonts in patched-fonts folder to ~/.fonts
Plugin 'ryanoasis/vim-webdevicons'				" If error with airline, reinstall airline to fix


"""""""""""""""""""""""""""""""""""""""""""""""""
" Colorschemes
"""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'ajh17/Spacegray.vim'
Plugin 'gosukiwi/vim-atom-dark'
Plugin 'yamafaktory/lumberjack.vim'
Plugin 'Junza/Spink'
Plugin 'cseelus/vim-colors-clearance'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings
""""""""""""""""""""""""""""""""""""""""""""
" Eclim autocomplete with youcompleteme
let g:EclimCompletionMethod = 'omnifunc'

" YouCompleteMe

" vim-go
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" Ctrl-P
" ignore directories
let g:ctrlp_custom_ignore = '\v[\/](node_modules|bower_components|vendor)|(\.(swp|ico|git|svn))$'

" NerdTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeSortOrder = ['\/$', '*', '\.toml']
let g:NERDTreeDirArrows = 0
let g:NERDTreeIgnore = ['.git[[dir]]']
let g:NERDSpaceDelims = 1

" Airline
" Go to https://github.com/powerline/fonts if airline fonts is ugly
" let g:airline_left_sep=''
" let g:airline_right_sep=''
let g:airline_theme='luna'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let airline#extensions#tabline#buffer_nr_show = 1

" Vim web dev icons
let g:webdevicons_enable_nerdtree = 0
let g:webdevicons_enable_airline_tabline = 0

" Minibuffer explorer
let g:miniBufExplorerAutoStart = 0 		"Just need the command :MBEbd to close current buffer and retain NERDTree

" Syntatic
let g:syntastic_echo_current_error = 1
let g:syntastic_enable_signs = 1
let g:syntastic_enable_balloons = 1
let g:syntastic_error_symbol = "•"

" Toggle tagbar
nmap <F8> :TagbarToggle<CR>

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

inoremap <c-x><c-k> <c-x><c-k>
"""""""""""""""""""""""""""""""""""""""""""""""""
" Fix issues between YouCompleteMe and UltiSnips
"""""""""""""""""""""""""""""""""""""""""""""""""
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"""""""""""""""""""""""""""""""""""""""""""""""""
" End
"""""""""""""""""""""""""""""""""""""""""""""""""



" Golang tagbar solution
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


"""""""""""""""""""""""""""""""""""""""""""""""""
" Highlights
"""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight current line number
hi CursorLineNR guifg=#F2FF5C gui=bold "

hi link rustStorage 		PreProc


