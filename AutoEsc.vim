" Author: Donglimao
" Email: regadvan@163.com
" Date: 2024-12-12
" ==========================================

if !exists('g:autoEscTime')
	let g:autoEscTime = 3
endif

function! CheckNumber(numStr)
	let l:non_digit = matchstr(a:numStr, '\D')
	if l:non_digit == ''
		let l:num = str2nr(a:numStr)
		let g:autoEscTime= l:num
		if l:num < 1000
			echom "Set AutoEscTime To " . l:num . "s"
		elseif l:num >= 1000
			echom "Set AutoEscTime To " . l:num . "ms"
		endif
	elseif l:non_digit != ''
		echom "SetAutoEscTime must be a number."
	endif
endfunction

command! -nargs=1 SetAutoEscTime call CheckNumber(<q-args>)

" echom  'first time' . g:autoEscTime

function! SendEscKey()
	if mode() =~# '[iIrRvV\^V]' || mode() !~# '[cC]'
		call feedkeys("\<Esc>")
	endif
endfunction

function! ResetMyTimer()

	if g:autoEscTime < 1000
		let l:autoEscTimeInner=1000 * g:autoEscTime
	elseif g:autoEscTime >= 1000
		let l:autoEscTimeInner=g:autoEscTime
	endif
	if exists('s:my_timer_id')
    "stlp timerlalk
    call timer_stop(s:my_timer_id)
  endif

"reset timer variable
" echom  'second time' . l:autoEscTimeInner
  let s:my_timer_id = timer_start(l:autoEscTimeInner, {id ->SendEscKey() })
endfunction

augroup InsertMove
	autocmd!
	autocmd TextChangedI * if mode() == "i" | call ResetMyTimer() | endif
	autocmd InsertEnter * call ResetMyTimer() 
	autocmd CursorMoved * if mode() !~# '[VvcC]' | call ResetMyTimer() | endif
	autocmd CursorMovedI * if mode() !~# '[VvcC]' | call ResetMyTimer() | endif 
	autocmd ModeChanged * if mode() =~# '[Vv\^V]' | call ResetMyTimer() | endif 
augroup END
