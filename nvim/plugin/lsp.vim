" Register LSPs
lua << EOF
  require'nvim_lsp'.rust_analyzer.setup{on_attach=require'diagnostic'.on_attach}
EOF

" Load completion for buffers
autocmd BufEnter * lua require'completion'.on_attach()
autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Use TAB as completion trigger
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" Inlays
lua << EOF
require'lsp_extensions'.inlay_hints{
  highlight = "Comment",
  prefix = " > ",
  aligned = false,
  only_current_line = false
}
EOF

" Inlay hints for the whole file
nnoremap <Leader>T :lua require'lsp_extensions'.inlay_hints()

" Only current line
nnoremap <Leader>t :lua require'lsp_extensions'.inlay_hints{ only_current_line = true }

" Run on showing file or new file in buffer
autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}

" On cursor hover, get hints for current line
autocmd CursorHold,CursorHoldI *.rs :lua require'lsp_extensions'.inlay_hints{ only_current_line = true }
