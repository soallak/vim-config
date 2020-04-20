" Plugin Keyboard-Mappings
" ---
if dein#tap('denite.nvim')
	nnoremap <silent><LocalLeader>r :<C-u>Denite -resume -refresh -no-start-filter<CR>
	nnoremap <silent><LocalLeader>f :<C-u>Denite file/rec<CR>
	nnoremap <silent><LocalLeader>g :<C-u>Denite grep -start-filter<CR>
	nnoremap <silent><LocalLeader>b :<C-u>Denite buffer file_mru -default-action=switch<CR>
	nnoremap <silent><LocalLeader>d :<C-u>Denite directory_rec directory_mru -default-action=cd<CR>
	nnoremap <silent><LocalLeader>v :<C-u>Denite neoyank -buffer-name=register<CR>
	xnoremap <silent><LocalLeader>v :<C-u>Denite neoyank -buffer-name=register -default-action=replace<CR>
	nnoremap <silent><LocalLeader>l :<C-u>Denite location_list -buffer-name=list -no-start-filter<CR>
	nnoremap <silent><LocalLeader>q :<C-u>Denite quickfix -buffer-name=list -no-start-filter<CR>
	nnoremap <silent><LocalLeader>n :<C-u>Denite dein<CR>
	nnoremap <silent><LocalLeader>j :<C-u>Denite jump change file/point -no-start-filter<CR>
	nnoremap <silent><LocalLeader>u :<C-u>Denite junkfile:new junkfile -buffer-name=list<CR>
	nnoremap <silent><LocalLeader>o :<C-u>Denite outline -no-start-filter<CR>
	nnoremap <silent><LocalLeader>s :<C-u>Denite session -buffer-name=list<CR>
	nnoremap <silent><LocalLeader>t :<C-u>Denite tag<CR>
	nnoremap <silent><LocalLeader>p :<C-u>Denite jump<CR>
	nnoremap <silent><LocalLeader>h :<C-u>Denite help<CR>
	nnoremap <silent><LocalLeader>m :<C-u>Denite file/rec -buffer-name=memo -path=~/docs/books<CR>
	nnoremap <silent><LocalLeader>z :<C-u>Denite z -buffer-name=list<CR>
	nnoremap <silent><LocalLeader>; :<C-u>Denite command_history command<CR>
	nnoremap <silent><expr><LocalLeader>/ wordcount().chars > 10000 ?
		\ ":\<C-u>Denite -search line/external\<CR>"
		\ : ":\<C-u>Denite -search line\<CR>"
	nnoremap <silent><expr><LocalLeader>* wordcount().chars > 10000 ?
		\ ":\<C-u>DeniteCursorWord -no-start-filter -search line/external\<CR>"
		\ : ":\<C-u>DeniteCursorWord -no-start-filter -search line\<CR>"

	" chemzqm/denite-git
	nnoremap <silent> <Leader>gl :<C-u>Denite gitlog:all -no-start-filter<CR>
	nnoremap <silent> <Leader>gs :<C-u>Denite gitstatus -no-start-filter<CR>
	nnoremap <silent> <Leader>gc :<C-u>Denite gitbranch -no-start-filter<CR>

	" Open Denite with word under cursor or selection
	nnoremap <silent> <Leader>gt :DeniteCursorWord tag:include -no-start-filter -immediately<CR>
	nnoremap <silent> <Leader>gf :DeniteCursorWord file/rec -no-start-filter<CR>
	nnoremap <silent> <Leader>gg :DeniteCursorWord grep -no-start-filter<CR>
	vnoremap <silent> <Leader>gg
		\ :<C-u>call <SID>get_selection('/')<CR>
		\ :execute 'Denite -no-start-filter grep:::'.@/<CR><CR>

	function! s:get_selection(cmdtype)
		let temp = @s
		normal! gv"sy
		let @/ = substitute(escape(@s, '\' . a:cmdtype), '\n', '\\n', 'g')
		let @s = temp
	endfunction
endif

if dein#tap('defx.nvim')
	nnoremap <silent> <LocalLeader>e
		\ :<C-u>Defx -toggle `getcwd()` -buffer-name=tab`tabpagenr()`<CR>
	nnoremap <silent> <LocalLeader>a
		\ :<C-u>Defx `getcwd()` -search=`expand('%:p')` -buffer-name=tab`tabpagenr()`<CR>
endif

if dein#tap('delimitMate')
	imap <buffer><expr> <C-Tab> delimitMate#JumpAny()
endif

if dein#tap('ale')
	nmap <silent> [c <Plug>(ale_previous)
	nmap <silent> ]c <Plug>(ale_next)
endif

if dein#tap('vim-gitgutter')
	nmap ]g <Plug>(GitGutterNextHunk)
	nmap [g <Plug>(GitGutterPrevHunk)
	nmap gS <Plug>(GitGutterStageHunk)
	xmap gS <Plug>(GitGutterStageHunk)
	nmap <Leader>gr <Plug>(GitGutterUndoHunk)
	nmap gs <Plug>(GitGutterPreviewHunk)
endif

if dein#tap('committia.vim')
	let g:committia_hooks = {}
	function! g:committia_hooks.edit_open(info)
		imap <buffer><C-d> <Plug>(committia-scroll-diff-down-half)
		imap <buffer><C-u> <Plug>(committia-scroll-diff-up-half)

		setlocal winminheight=1 winheight=1
		resize 10
		startinsert
	endfunction
endif

" vim: set ts=2 sw=2 tw=80 noet :
