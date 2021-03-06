" Plugins
call plug#begin("~/.config/nvim/plugged")
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'elixir-editors/vim-elixir'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'pangloss/vim-javascript'
Plug 'mtth/scratch.vim'

" Themes
Plug 'drewtempelmeyer/palenight.vim'
call plug#end()

" Colors
" set background=dark
colorscheme palenight " Set the colorscheme

if has('termguicolors')
  set termguicolors " Enables 24-bit colors
endif

let g:palenight_termcolors=16 " Palenight theme setting

" Status bar color setting
let g:lightline = {
  \ 'colorscheme': 'palenight',
  \}

" Editor
let mapleader=" " " Set the leader key to space
syntax enable " Enable syntax highlight
set noshowmode " Shows the current mode
set number relativenumber " Sets line numbers and makes them relative
set cursorline " Highlights the current line
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when needed
set showmatch " highlight matching [{()}]
filetype indent on " load filetype-specific indent files
set hlsearch " highlight search matches
set incsearch " search while typing
set confirm " Always confirms before actions like closing a file
set foldenable " Enables code folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
set foldmethod=indent " fold based on indent level

nnoremap <leader>ot :below 10sp term://zsh<cr>i
nnoremap <leader><leader> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
let $FZF_DEFAULT_COMMAND='rg --files --hidden'

" Terminal
if has("nvim")
  au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  au FileType fzf tunmap <buffer> <Esc>
endif
" NERDTree

let g:NERDTreeShowHidden = 1 

let g:NERDTreeMinimalUI = 1 " hide helper

let g:NERDTreeIgnore = ['^node_modules$'] " ignore node_modules to increase load speed 

let g:NERDTreeStatusline = '' " set to empty to use lightline

" " Toggle

noremap <silent> <C-b> :NERDTreeToggle<CR>

" " Close window if NERDTree is the last one

autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" " Map to open current file in NERDTree and set size

nnoremap <leader>pv :NERDTreeFind<bar> :vertical resize 45<CR>



" NERDTree Syntax Highlight

" " Enables folder icon highlighting using exact match

let g:NERDTreeHighlightFolders = 1 

" " Highlights the folder name

let g:NERDTreeHighlightFoldersFullName = 1 

" " Color customization

let s:brown = "905532"

let s:aqua =  "3AFFDB"

let s:blue = "689FB6"

let s:darkBlue = "44788E"

let s:purple = "834F79"

let s:lightPurple = "834F79"

let s:red = "AE403F"

let s:beige = "F5C06F"

let s:yellow = "F09F17"

let s:orange = "D4843E"

let s:darkOrange = "F16529"

let s:pink = "CB6F6F"

let s:salmon = "EE6E73"

let s:green = "8FAA54"

let s:lightGreen = "31B53E"

let s:white = "FFFFFF"

let s:rspec_red = 'FE405F'

let s:git_orange = 'F54D27'

" " This line is needed to avoid error

let g:NERDTreeExtensionHighlightColor = {} 

" " Sets the color of css files to blue

let g:NERDTreeExtensionHighlightColor['css'] = s:blue 

" " This line is needed to avoid error

let g:NERDTreeExactMatchHighlightColor = {} 

" " Sets the color for .gitignore files

let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange 

" " This line is needed to avoid error

let g:NERDTreePatternMatchHighlightColor = {} 

" " Sets the color for files ending with _spec.rb

let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red 

" " Sets the color for folders that did not match any rule

let g:WebDevIconsDefaultFolderSymbolColor = s:beige 

" " Sets the color for files that did not match any rule

let g:WebDevIconsDefaultFileSymbolColor = s:blue 



" NERDTree Git Plugin

let g:NERDTreeGitStatusIndicatorMapCustom= {
    \ "Modified"  : "???",
    \ "Staged"    : "???",
    \ "Untracked" : "???",
    \ "Renamed"   : "???",
    \ "Unmerged"  : "???",
    \ "Deleted"   : "???",
    \ "Dirty"     : "???",
    \ "Clean"     : "??????",
    \ 'Ignored'   : '???',
    \ "Unknown"   : "?"
    \ }

"Nerd Commenter

" " Use compact syntax for prettified multi-line comments

let g:NERDCompactSexyComs = 1

" " Allow commenting and inverting empty lines (useful when commenting a region)

let g:NERDCommentEmptyLines = 1

" " Enable trimming of trailing whitespace when uncommenting

let g:NERDTrimTrailingWhitespace = 1

" " Enable NERDCommenterToggle to check all selected lines is commented or not

let g:NERDToggleCheckAllLines = 1

" " Add spaces after comment delimiters by default

let g:NERDSpaceDelims = 1

" " Map ++ to call NERD Commenter and use iTerm key bindings 

" " to bind Ctmd+/ to ++

vmap ++ <plug>NERDCommenterToggle

nmap ++ <plug>NERDCommenterToggle

" ALE (Asynchronous Lint Engine)

let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }

let g:ale_sign_error = '???'

let g:ale_sign_warning = '??????'

let g:ale_fix_on_save = 1

" COC

" " COC extension

let g:coc_user_config = {}

let g:coc_global_extensions = [
      \ 'coc-emmet', 
      \ 'coc-css', 
      \ 'coc-html', 
      \ 'coc-json', 
      \ 'coc-prettier', 
      \ 'coc-tsserver', 
      \ 'coc-snippets', 
      \ 'coc-eslint']

" " To go back to previous state use Ctrl+O

nmap <silent><leader>gd <Plug>(coc-definition)

nmap <silent><leader>gy <Plug>(coc-type-definition)

nmap <silent><leader>gi <Plug>(coc-implementation)

nmap <silent><leader>gr <Plug>(coc-references)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" " Always show the signcolumn, otherwise it would shift the text each time

" " diagnostics appear/become resolved.

if has("patch-8.1.1564")
  " " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" " Use <c-space> to trigger completion.

inoremap <silent><expr> <c-space> coc#refresh() 

" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current

" " position. Coc only does snippet and additional edit on confirm.

" " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif


" " Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" " Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


" " Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected

augroup mygroup
  autocmd!
  " " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" " Applying codeAction to the selected region.

" " Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)


" " Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)

" " Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" " Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" " Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" " Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')


" " Add (Neo)Vim's native statusline support.
" " NOTE: Please see `:h coc-status` for integrations with external plugins that
" " provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
