""""""""""""""""""""""""""""""""""""""""""""
" Load Plugins
""""""""""""""""""""""""""""""""""""""""""""
filetype off                                    " required
set rtp+=~/.vim/bundle/Vundle.vim               " set the runtime path to include Vundle and initialize
call vundle#begin()                             " alternatively, pass a path where Vundle should install plugins
                                                " call vundle#begin('~/some/path/here')
"YouCompleteMe only works in linux/Mac OSX
if has('unix')
    Plugin 'Valloric/YouCompleteMe'             " auto popup for autocomplete, without this we need to press <Ctrl+x+o>
endif

Plugin 'gmarik/Vundle.vim'                      " let Vundle manage Vundle, required
Plugin 'flazz/vim-colorschemes'                 " vim colorschemes
Plugin 'fatih/vim-go'                           " Go programming language
Plugin 'vim-airline/vim-airline'                " Beautiful status bars
Plugin 'vim-airline/vim-airline-themes'
Plugin 'fholgado/minibufexpl.vim'               " Using it for deleting buffer fastly
Plugin 'ctrlpvim/ctrlp.vim'                     " Fast file finder just like sublime ctrl+p
Plugin 'scrooloose/nerdtree'                    " Plugin for listing directory structure
Plugin 'scrooloose/nerdcommenter'               " Commenter
Plugin 'majutsushi/tagbar'                      " Plugin for showing functions and vars description
Plugin 'tpope/vim-fugitive'                     " Plugin for git inside vim
Plugin 'scrooloose/syntastic'                   " Plugin for error highlighter
Plugin 'Townk/vim-autoclose'                    " Plugin for autoclose brace () {}
Plugin 'terryma/vim-multiple-cursors'           " Multiple selection just like in sublime Ctrl + d selection
Plugin 'pangloss/vim-javascript'                " Javascript indentation + Syntax
Plugin 'godlygeek/tabular'                      " Automatic alignment
Plugin 'SirVer/ultisnips'                       " Code snippets
Plugin 'honza/vim-snippets'                     " Collection of snippets for ultisnipes
Plugin 'cespare/vim-toml'                       " TOML syntax highlighting
Plugin 'mattn/emmet-vim'                        " Emmet plugin
Plugin 'gregsexton/MatchTag'                    " Highlight matched tag
Plugin 'tmhedberg/matchit'                      " Jump between matched tags
Plugin 'wting/rust.vim'                         " Rust syntax highlighting
Plugin 'myusuf3/numbers.vim'                    " Relative number line
Plugin 'tpope/vim-surround'                     " Insert text in surrounding selected text
Plugin 'groenewege/vim-less'                    " Less syntax highlighting
Plugin 'mustache/vim-mustache-handlebars'       " Highlight handlebars
Plugin 'mileszs/ack.vim'                        " For searching, install http://beyondgrep.com/install first
Plugin 'editorconfig/editorconfig-vim'          " Vim will read .editorconfig and set the configuration based on it
Plugin 'xsbeats/vim-blade'                      " Laravel blade syntax highlighting
Plugin 'StanAngeloff/php.vim'                   " PHP Syntax highlighting
Plugin 'christoomey/vim-tmux-navigator'         " To navigate between panes seamessly in vim
Plugin 'embear/vim-localvimrc'                  " Load local vimrc if exist (Will override global vimrc)
Plugin 'easymotion/vim-easymotion'
Plugin 'eagletmt/neco-ghc'                      " Haskell autocomplete
Plugin 'moll/vim-node'                          " Node plugin
Plugin 'Shougo/vimproc.vim'
Plugin 'ternjs/tern_for_vim'
Plugin 'keith/swift.vim'                        " Swift syntax and indent files
Plugin 'rhysd/conflict-marker.vim'              " Jump and resolve git conflicts
Plugin 'mxw/vim-jsx'                            " React JSX plugin

" If error with airline, reinstall airline to fix
" Clone https://github.com/ryanoasis/nerd-filetype-glyphs-fonts-patcher first
" Copy fonts in patched-fonts folder to ~/.fonts
Plugin 'ryanoasis/vim-webdevicons'                  " If error with airline, reinstall airline to fix

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

""""""""""""""""""""""""""""""""""""""""""""
" Vim Settings
""""""""""""""""""""""""""""""""""""""""""""
let in_linux_mint = system("cat /etc/issue | grep 'Linux Mint' -o") == "Linux Mint\n"
let in_macvim = has("gui_macvim")
let in_terminal = !has('gui_running')

if in_terminal
  set t_Co=256
else
  set guioptions -=T              " remove toolbar on gvim
  set guioptions -=r              " remove right-hand scroll bar
  set guioptions -=L              " remove left-hand scroll bar
  set guioptions -=m              " remove menu bar
  set guioptions -=M              " remove menu bar
endif

colorscheme hybrid

if in_linux_mint " Linux Mint
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 15
elseif in_macvim " Mac
    set guifont=DejaVu_Sans_Mono_for_Powerline_Plus_Nerd_File_Types_Mono:h13
else
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
endif

filetype plugin indent on
set splitbelow                  " Set open new split panes to right and bottom, which feels more natural than Vim’s default
set splitright
set lazyredraw
set colorcolumn=80              " Show vertical ruler that at the 80th column
set tabstop=2                   " Set tab size to 2
set nocompatible                " be improved, required
set number                      " turn on number lines
set showcmd                     " show command on pressing keystrokes
set autoindent                  " enables auto indentation
set ruler                       " enables rule<LeftMouse>
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set shiftwidth=2                " number of spaces to use for autoindenting
set encoding=utf-8
set linespace=2                 " space between lines
set hlsearch                    " highlight search terms
set hidden                      " Do not delete undo history when switching between buffers
set nobackup
set noswapfile
set completeopt-=preview        " remove window information hint (on top of main window) after we use tab when autocomplete pops out
set expandtab                   " Indentation using space
set foldmethod=indent
set foldlevelstart=20           " Open 20 folds when first time opening a file
set nowrap
set linebreak
set nolist
set formatoptions+=t
set textwidth=0
set wrapmargin=0
set timeoutlen=300
syntax on

" Filetypes
augroup filetypedetect
  au! BufRead,BufNewFile *.hbs,*.handlebars setf handlebars
  au! BufRead,BufNewFile *.blade.php set filetype=html
augroup END

autocmd FileType html       : setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascript : setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType handlebars : setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType less       : setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType python     : setlocal shiftwidth=4 tabstop=4 expandtab
autocmd BufWritePre * :%s/\s\+$//e " automatically trim trailing space everytime we save

""""""""""""""""""""""""""""""""""""""""""""
"MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ' '

" Remap :w<CR> to Ctrl+s
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>a

" Press F3 to check current element highlight-group
map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

" Close current buffer
nnoremap QQ :MBEbd <CR>

noremap L g_
norema  H ^


" use \" and \- to resize vertical splits
nnoremap <silent> <leader>= :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

" Press F5 to open a list of opened buffers and press <Enter> to open it
nnoremap <F5> :buffers<CR>:buffer<Space>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>sv :so ~/.vimrc<CR>

" Ctrl + L || Ctrl + H to scroll horizontally
nmap <C-L> 5zl
nmap <C-H> 5zh

" Tmux navigator key mapping
nnoremap <silent> <leader>wj :TmuxNavigateDown<cr>
nnoremap <silent> <leader>wh :TmuxNavigateLeft<cr>
nnoremap <silent> <leader>wk :TmuxNavigateUp<cr>
nnoremap <silent> <leader>wl :TmuxNavigateRight<cr>

" Comment toggle on normal mode with Ctrl+C
nmap <C-c> \c<space>

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

nnoremap <silent> <leader>nn :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings
""""""""""""""""""""""""""""""""""""""""""""
" Eclim autocomplete with youcompleteme
let g:EclimCompletionMethod = 'omnifunc'

" Neco GHC
" Haskell autocompletion using youcompleteme
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:necoghc_enable_detailed_browse = 1

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_add_preview_to_completeopt = 1

if in_macvim
    let g:ycm_path_to_python_interpreter = '/usr/bin/python'
endif

" Vim handlebars
let g:mustache_abbreviations = 1

" vim-go
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" Ctrl-P
" ignore directories
let g:ctrlp_map = '<c-q>'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|bower_components|vendor)|(\.(swp|ico|git|svn))$'
let g:ctrlp_show_hidden = 1
let g:ctrlp_prompt_mappings = { 'PrtClearCache()': ['<F2>'] }

" NerdTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeSortOrder = ['\/$', '*', '\.toml']
let g:NERDTreeDirArrows = 1
let g:NERDTreeIgnore = ['.git[[dir]]', '.idea[[dir]]']
let g:NERDSpaceDelims = 1

" Airline
" Go to https://github.com/powerline/fonts if airline fonts is ugly
" let g:airline_left_sep=''
" let g:airline_right_sep=''
let g:airline_theme='hybrid'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let airline#extensions#tabline#buffer_nr_show = 1

" Vim web dev icons
let g:webdevicons_enable_nerdtree = 0
let g:webdevicons_enable_airline_tabline = 0

" Minibuffer explorer
let g:miniBufExplorerAutoStart = 0         "Just need the command :MBEbd to close current buffer and retain NERDTree

" Vim emmet
let g:user_emmet_leader_key='\'

" Syntatic
let g:syntastic_echo_current_error = 1
let g:syntastic_enable_signs = 1
let g:syntastic_enable_balloons = 1
let g:syntastic_javascript_checkers = ['eslint']
let b:syntastic_javascript_eslint_exec = 'eslint'
let g:syntastic_always_populate_loc_list = 1  " Always populate loc list so we can use lnext and lprev to jump to errors
let g:syntastic_html_tidy_quiet_messages = { "level" : "warnings" }
let g:syntastic_error_symbol = '×'

" Tmux navigator
let g:tmux_navigator_no_mappings = 1

" Vim Tern
let g:tern_request_timeout = 3

" Toggle tagbar
nmap <F8> :TagbarToggle<CR>

" Ulti snip
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

inoremap <c-x><c-k> <c-x><c-k>

" Vim JSX
" By default, JSX syntax highlighting and indenting will be enabled only
" for files with the .jsx extension, we want syntax highlighting in .js files
" too
let g:jsx_ext_required = 0

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
hi SyntasticErrorSign guifg=#6d90d1

" Change cursor color to white
hi Cursor guibg=#618AFB guifg=white

" Change cursor color to green when in insert mode
au InsertEnter * hi Cursor guibg=#618AFB guifg=white ctermbg=39 ctermfg=white

hi link rustStorage             PreProc
hi link mustacheConditionals    Function
hi link mustacheHelpers         Function
hi link mustacheSection         Function
hi link htmlLink                None
