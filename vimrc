
"----------------------------------------------------------------------
" 基础设置
"----------------------------------------------------------------------

" 禁用 vi 兼容模式
" 加载netrw—Vim’s Native File Explorer
set nocompatible

" 自动缩进
set autoindent

" Make command line two lines high
set ch=2		

"行号
set number 

" 自动缩进
set autoindent    

" 打开 C/C++ 语言缩进优化
set cindent

" 光标显示优化
" 显示光标位置
" set rulerVideos

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Hide the mouse when typing text
set mousehide		

"空格代替Tab"
"注意: 插入模式下输入【ctrl+v+i】可以强制输入一个tab
set tabstop=4     " tabstop 表示一个 tab 显示出来是多少个空格的长度，默认8
set softtabstop=4 " softtabstop
"表示在编辑模式的时候按退格键的时候退回缩进的长度，当使用 expandtab 时特别有用
set expandtab     " 当设置成 expandtab 时，缩进用空格来表示，noexpandtab
"则是用制表符表示一个缩进
set shiftwidth=4  " 自动缩进空白字符个数

set autoindent    " 自动缩进
set cindent       " 自动缩进补充

"wildmenu
"auto complition of menu
" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

"将y和p的内容和系统剪粘板同步
set clipboard=unnamed,unnamedplus

"启用右键粘贴
"先加载系统配置，再用新配置覆盖，避免本人设置被系统设置覆盖
let g:skip_defaults_vim = 1
"Vim默认mouse=a(all)，启用鼠标模式，鼠标右键用于定位光标，所以无法像终端一样右键粘贴，关闭即可
set mouse=

"----------------------------------------------------------------------
" 搜索设置
"----------------------------------------------------------------------

" 高亮搜索内容
set hlsearch

" 查找输入时动态增量显示查找结果
set incsearch

" 搜索时忽略大小写
set ignorecase

" 智能搜索大小写判断，默认忽略大小写，除非搜索内容包含大写字母
set smartcase


"----------------------------------------------------------------------
" 语法高亮设置
"----------------------------------------------------------------------
if has('syntax')  
	syntax enable 
	syntax on 
endif


"----------------------------------------------------------------------
" 其他设置
"----------------------------------------------------------------------

" 显示匹配的括号
set showmatch

" 显示括号匹配的时间
set matchtime=2

" 显示最后一行
set display=lastline

" 允许下方显示目录
set wildmenu
set wildmode=list:longest,full " Complete till longest string, " then open the wildmenu.

" 延迟绘制（提升性能）
set lazyredraw

"----------------------------------------------------------------------
" 设置代码折叠
"----------------------------------------------------------------------
if has('folding')
	" 允许代码折叠
	set foldenable

	" 代码折叠默认使用缩进
	set fdm=indent

	" 默认打开所有缩进
	set foldlevel=99
endif

"----------------------------------------------------------------------
" 配色
"----------------------------------------------------------------------

"colorscheme torte  "修改配色方案
colorscheme desert  "修改配色方案
"colorscheme molokai  "修改配色方案
"colorscheme solarized  "修改配色方案


"----------------------------------------------------------------------
" 自动补全设置
"----------------------------------------------------------------------

set complete+=k " enable completion of words in the spelling dictionary
set complete-=i " 在自动补全列表中，去掉include，因为include太慢了

set spell "enable spell checking"
set spelllang=en,cjk "使中文、日文等语言不会被视为错误"


"----------------------------------------------------------------------
" html自动补全
set cursorcolumn
"----------------------------------------------------------------------

autocmd BufNewFile *  setlocal filetype=html
function! InsertHtmlTag()
	let pat = '\c<\w\+\s*\(\s\+\w\+\s*=\s*[''#$;,()."a-z0-9]\+\)*\s*>'
	normal! a>
	let save_cursor = getpos('.')
	let result = matchstr(getline(save_cursor[1]), pat)
	"if (search(pat, 'b', save_cursor[1]) && searchpair('<','','>','bn',0,  getline('.')) > 0)
	if (search(pat, 'b', save_cursor[1]))
		normal! lyiwf>
		normal! a</
		normal! p
		"normal! a>
	endif
	:call cursor(save_cursor[1], save_cursor[2], save_cursor[3])
endfunction
inoremap > <ESC>:call InsertHtmlTag()<CR>a

" html setting
" html tag regular express
let @t='\v\<\/?\w+>'
" html 自动换行
let @a='0A<br/0j'

"----------------------------------------------------------------------
" 插件安装
"----------------------------------------------------------------------


call plug#begin('/etc/vim/plugged')

    " 一个文件树插件
    Plug 'preservim/nerdtree'

    	" 展示开始画面，显示最近编辑过的文件
	Plug 'mhinz/vim-startify'

    "vim-csv csv文件处理
    "Plug 'chrisbra/csv.vim'

	" 默认不显示 startify
	"let g:startify_disable_at_vimenter = 1
    let g:startify_session_autoload = 1
	let g:startify_session_dir = '~/.vim/session'

	" signify 调优
	"let g:signify_vcs_list = ['git', 'svn']
	let g:signify_sign_add               = '+'
	let g:signify_sign_delete            = '_'
	let g:signify_sign_delete_first_line = '‾'
	let g:signify_sign_change            = '~'
	let g:signify_sign_changedelete      = g:signify_sign_change

    "起始页显示的列表长度
    let g:startify_files_number = 30

    " 用于在侧边符号栏显示 marks （ma-mz 记录的位置）
	Plug 'kshenoy/vim-signature'

	" 用于在侧边符号栏显示 git/svn 的 diff
	Plug 'mhinz/vim-signify'


call plug#end()

