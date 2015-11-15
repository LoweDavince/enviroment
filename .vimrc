if has("gui_running")
let g:isGUI = 1
else
let g:isGUI = 0
endif

if g:isGUI      " 使用GUI界面时的设置
set guioptions+=c        " 使用字符提示框
set guioptions-=m        " 隐藏菜单栏
"set guioptions-=T        " 隐藏工具栏
set guioptions-=L        " 隐藏左侧滚动条
"set guioptions-=r        " 隐藏右侧滚动条
set guioptions-=b        " 隐藏底部滚动条
"set showtabline=0       " 隐藏Tab栏
set cursorline           " 突出显示当前行
endif


fun! ToggleFullscreen()     " 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
map <silent> <F10> :call ToggleFullscreen()<CR> " 全屏开/关快捷键
"autocmd VimEnter * call ToggleFullscreen()  " 启动 vim 时自动全屏





set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'
let g:vundle_default_git_proto='git'

Plugin 'The-NERD-Tree'
let NERDChirstmasTree=1
let NERDTreeWinSize=25
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>nn :exec("NERDTree ".expand('%:h'))<CR><C-D>  

Plugin 'Yggdroot/indentLine'
let g:indentLine_enable=1
let g:indentLine_char='|'

Plugin 'taglist.vim'
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
nnoremap <leader>l :TlistToggle<CR>

Plugin 'tomasr/molokai'
colorscheme molokai
set background=dark
set t_Co=256
"colorscheme solarized
"colorscheme phd

Plugin 'Lokaltog/vim-powerline'
Plugin 'Valloric/YouCompleteMe'
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>jj :YcmCompleter GoToDefinition<CR>
nnoremap <leader>dd :YcmCompleter GoToDeclaration<CR>

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"let g:ycm_collect_identifiers_from_tags_files = 1
"let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0

set completeopt=longest,menu  "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"  "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1  " 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>  "force recomile with syntastic
"nnoremap <leader>lo :lopen<CR> "open locationlist
"nnoremap <leader>lc :lclose<CR>  "close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0


"Plugin 'scrooloose/syntastic'
"""""""""""syntastic""""""""""""
"let g:syntastic_check_on_open = 0
"let g:syntastic_cpp_include_dirs = ['/usr/include/']
"let g:syntastic_cpp_remove_include_errors = 1
"let g:syntastic_cpp_check_header = 1
"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
""set error or warning signs
"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '⚠'
""whether to show balloons
"let g:syntastic_enable_balloons = 1
"
Plugin 'terryma/vim-multiple-cursors'
let g:multi_cursor_next_key='<C-c>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
Plugin 'scrooloose/nerdcommenter'
"[count]<leader>cc |NERDComComment|
"Comment out the current line or text selected in visual mode.*/*/
"[count]<leader>ci |NERDComInvertComment|
"Toggles the comment state of the selected line(s) individually.
Plugin 'vim-scripts/DoxygenToolkit.vim'
let g:DoxygenToolkit_authorName="davince, loweddavince@gmail.com"
let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1
nnoremap <leader>da :DoxAuthor<CR>
nnoremap <leader>do :Dox<CR>
Plugin 'yonchu/accelerated-smooth-scroll'
Plugin 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
Plugin 'nathanaelkane/vim-indent-guides'
set ts=4 sw=4 et
let g:indent_guides_auto_colors = 0


let g:ctrlp_map = '<c-p>'



Plugin 'mileszs/ack.vim'
"apt-get install ack-grep
Plugin 'dyng/ctrlsf.vim'
nmap     <leader>ff <Plug>CtrlSFPrompt
vmap     <leader>ff <Plug>CtrlSFVwordPath
"vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <leader>wp <Plug>CtrlSFCwordPath
"nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>


Plugin 'junegunn/goyo.vim'
nnoremap <Leader>gy :Goyo<CR>
let g:goyo_width=80 "(default: 80)
let g:goyo_margin_top=4 "(default: 4)
let g:goyo_margin_bottom=4 "(default: 4)
let g:goyo_linenr=0 "(default: 0)
function! s:goyo_before()
silent !tmux set status off
set noshowmode
set noshowcmd
" ...
endfunction
function! s:goyo_after()
silent !tmux set status on
set showmode
set showcmd
" ...
endfunction

let g:goyo_callbacks = [function('s:goyo_before'), function('s:goyo_after')]
set laststatus=2
set expandtab
set cindent
set smartindent
set showcmd
set number
set tabstop=2
set softtabstop=2
set shiftwidth=2
set guifont=dejavu\ sans\ mono\ 10
set backspace=2
syntax enable
set cursorline
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
set cursorcolumn
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
""""""Enable filetype plugin
filetype on
if has("eval") && v:version>=600
filetype plugin on
filetype indent on
endif

""""""Set to auto read when a file is changed from the outside
if exists("&autoread")
set autoread
endif
"paste
nnoremap <leader>v "+gP
nnoremap <leader>y "+gY
"nnoremap <leader>x "+gx
"gvim
"shift+# shift+* back search and forward search
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>= :tabnew <CR> <Esc> <C-P> 
nnoremap <leader>- :close <CR>
nnoremap <leader>f :/
"DICTIONARY
 function! Mydict()
  let expl=system('sdcv -n ' .
        \  expand("<cword>"))
  windo if
        \ expand("%")=="diCt-tmp" |
        \ q!|endif
  25vsp diCt-tmp
  setlocal buftype=nofile bufhidden=hide noswapfile
  1s/^/\=expl/
  1
endfunction
nmap F :call Mydict()<CR><C-W><C-W>
"Text Transform
"shift + tilde
"其实这些用的时候都不多,记住用~切换就解决了80%的问题了!


"switch between windows of the current application.  
"alt + tilde 

