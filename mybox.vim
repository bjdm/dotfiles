" -----------------------------------------------------------------------------
" File: mybox.vim
" Description: mybox inspired color scheme for Vim
" Author: jdbm
" Source: 
" Last Modified:
" -----------------------------------------------------------------------------

" Supporting code -------------------------------------------------------------
" Initialisation: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='mybox'

if !has('gui_running') && &t_Co != 256
  finish
endif

" }}}
" Global Settings: {{{

if !exists('g:mybox_bold')
  let g:mybox_bold=1
endif
if !exists('g:mybox_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:mybox_italic=1
  else
    let g:mybox_italic=0
  endif
endif
if !exists('g:mybox_undercurl')
  let g:mybox_undercurl=1
endif
if !exists('g:mybox_underline')
  let g:mybox_underline=1
endif
if !exists('g:mybox_inverse')
  let g:mybox_inverse=1
endif

if !exists('g:mybox_guisp_fallback') || index(['fg', 'bg'], g:mybox_guisp_fallback) == -1
  let g:mybox_guisp_fallback='NONE'
endif

if !exists('g:mybox_improved_strings')
  let g:mybox_improved_strings=0
endif

if !exists('g:mybox_improved_warnings')
  let g:mybox_improved_warnings=0
endif

if !exists('g:mybox_termcolors')
  let g:mybox_termcolors=256
endif

if !exists('g:mybox_invert_indent_guides')
  let g:mybox_invert_indent_guides=0
endif

let s:is_dark=(&background == 'dark')

" }}}
" Palette: {{{

" setup palette dictionary
let s:gb = {}

" fill it with absolute colors
let s:gb.dark0       = ['#101112', 235]     " 40-40-40
let s:gb.dark1       = ['#141617', 237]     " 60-56-54
let s:gb.dark2       = ['#191A1C', 239]     " 80-73-69
let s:gb.dark3       = ['#1D1F21', 241]     " 102-92-84
let s:gb.dark4       = ['#222426', 243]     " 124-111-100

let s:gb.gray_245    = ['#303336', 245]     " 146-131-116
let s:gb.gray_244    = ['#27292B', 244]     " 146-131-116

let s:gb.light0      = ['#ebdbb2', 229]     " 253-244-193
let s:gb.light1      = ['#5B6066', 223]     " 235-219-178
let s:gb.light2      = ['#4F5459', 250]     " 213-196-161
let s:gb.light3      = ['#44484C', 248]     " 189-174-147
let s:gb.light4      = ['#393C40', 246]     " 168-153-132

let s:gb.bright_red     = ['#b21f19', 167]     " 251-73-52
let s:gb.bright_green   = ['#b8bb26', 142]     " 184-187-38
let s:gb.bright_yellow  = ['#fabd2f', 214]     " 250-189-47
let s:gb.bright_blue    = ['#83a598', 109]     " 131-165-152
let s:gb.bright_purple  = ['#d3869b', 175]     " 211-134-155
let s:gb.bright_aqua    = ['#8ec07c', 108]     " 142-192-124
let s:gb.bright_orange  = ['#fe8019', 208]     " 254-128-25

let s:gb.neutral_red    = ['#cc241d', 124]     " 204-36-29
let s:gb.neutral_green  = ['#98971a', 106]     " 152-151-26
let s:gb.neutral_yellow = ['#d79921', 172]     " 215-153-33
let s:gb.neutral_blue   = ['#458588', 66]      " 69-133-136
let s:gb.neutral_purple = ['#b16286', 132]     " 177-98-134
let s:gb.neutral_aqua   = ['#689d6a', 72]      " 104-157-106
let s:gb.neutral_orange = ['#d65d0e', 166]     " 214-93-14

let s:gb.faded_red      = ['#9d0006', 88]      " 157-0-6
let s:gb.faded_green    = ['#79740e', 100]     " 121-116-14
let s:gb.faded_yellow   = ['#b57614', 136]     " 181-118-20
let s:gb.faded_blue     = ['#076678', 24]      " 7-102-120
let s:gb.faded_purple   = ['#8f3f71', 96]      " 143-63-113
let s:gb.faded_aqua     = ['#427b58', 66]      " 66-123-88
let s:gb.faded_orange   = ['#af3a03', 130]     " 175-58-3

" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:mybox_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:mybox_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:mybox_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:mybox_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:mybox_inverse == 0
  let s:inverse = ''
endif

" }}}
" Setup Colors: {{{

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" determine relative colors
if s:is_dark
  let s:bg0  = s:gb.dark0

  let s:bg1  = s:gb.dark1
  let s:bg2  = s:gb.dark2
  let s:bg3  = s:gb.dark3
  let s:bg4  = s:gb.dark4

  let s:gray = s:gb.gray_245

  let s:fg0 = s:gb.light0
  let s:fg1 = s:gb.light1
  let s:fg2 = s:gb.light2
  let s:fg3 = s:gb.light3
  let s:fg4 = s:gb.light4

  let s:fg4_256 = s:gb.light4_256

  let s:red    = s:gb.bright_red
  let s:green  = s:gb.bright_green
  let s:yellow = s:gb.bright_yellow
  let s:blue   = s:gb.bright_blue
  let s:purple = s:gb.bright_purple
  let s:aqua   = s:gb.bright_aqua
  let s:orange = s:gb.bright_orange
else
  let s:bg0  = s:gb.light0

  let s:bg1  = s:gb.light1
  let s:bg2  = s:gb.light2
  let s:bg3  = s:gb.light3
  let s:bg4  = s:gb.light4

  let s:gray = s:gb.gray_244

  let s:fg0 = s:gb.dark0
  let s:fg1 = s:gb.dark1
  let s:fg2 = s:gb.dark2
  let s:fg3 = s:gb.dark3
  let s:fg4 = s:gb.dark4

  let s:red    = s:gb.faded_red
  let s:green  = s:gb.faded_green
  let s:yellow = s:gb.faded_yellow
  let s:blue   = s:gb.faded_blue
  let s:purple = s:gb.faded_purple
  let s:aqua   = s:gb.faded_aqua
  let s:orange = s:gb.faded_orange
endif

" reset to 16 colors fallback
if g:mybox_termcolors == 16
  let s:bg0[1]    = 0
  let s:fg4[1]    = 7
  let s:gray[1]   = 8
  let s:red[1]    = 9
  let s:green[1]  = 10
  let s:yellow[1] = 11
  let s:blue[1]   = 12
  let s:purple[1] = 13
  let s:aqua[1]   = 14
  let s:fg1[1]    = 15
endif

" save current relative colors back to palette dictionary
let s:gb.bg0 = s:bg0
let s:gb.bg1 = s:bg1
let s:gb.bg2 = s:bg2
let s:gb.bg3 = s:bg3
let s:gb.bg4 = s:bg4

let s:gb.gray = s:gray

let s:gb.fg0 = s:fg0
let s:gb.fg1 = s:fg1
let s:gb.fg2 = s:fg2
let s:gb.fg3 = s:fg3
let s:gb.fg4 = s:fg4

let s:gb.red    = s:red
let s:gb.green  = s:green
let s:gb.yellow = s:yellow
let s:gb.blue   = s:blue
let s:gb.purple = s:purple
let s:gb.aqua   = s:aqua
let s:gb.orange = s:orange

" }}}

" Overload Setting: {{{

let s:hls_cursor = s:orange
if exists('g:mybox_hls_cursor')
  let s:hls_cursor = get(s:gb, g:mybox_hls_cursor)
endif

let s:number_column = s:bg4
if exists('g:mybox_number_column')
  let s:number_column = get(s:gb, g:mybox_number_column)
endif

let s:sign_column = s:bg1

if exists('g:gitgutter_override_sign_column_highlight') &&
      \ g:gitgutter_override_sign_column_highlight == 1
  let s:sign_column = s:number_column
else
  let g:gitgutter_override_sign_column_highlight = 0

  if exists('g:mybox_sign_column')
    let s:sign_column = get(s:gb, g:mybox_sign_column)
  endif
endif

let s:color_column = s:bg1
if exists('g:mybox_color_column')
  let s:color_column = get(s:gb, g:mybox_color_column)
endif

let s:vert_split = s:bg2
if exists('g:mybox_vert_split')
  let s:vert_split = get(s:gb, g:mybox_vert_split)
endif

let s:invert_signs = ''
if exists('g:mybox_invert_signs')
  if g:mybox_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:mybox_invert_selection')
  if g:mybox_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:mybox_invert_tabline')
  if g:mybox_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:italicize_comments = s:italic
if exists('g:mybox_italicize_comments')
  if g:mybox_italicize_comments == 0
    let s:italicize_comments = ''
  endif
endif

let s:italicize_strings = ''
if exists('g:mybox_italicize_strings')
  if g:mybox_italicize_strings == 1
    let s:italicize_strings = s:italic
  endif
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:mybox_guisp_fallback != 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:mybox_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" }}}
" mybox Hi Groups: {{{

" memoize common hi groups
call s:HL('myboxFg0', s:fg0)
call s:HL('myboxFg1', s:fg1)
call s:HL('myboxFg2', s:fg2)
call s:HL('myboxFg3', s:fg3)
call s:HL('myboxFg4', s:fg4)
call s:HL('myboxGray', s:gray)
call s:HL('myboxBg0', s:bg0)
call s:HL('myboxBg1', s:bg1)
call s:HL('myboxBg2', s:bg2)
call s:HL('myboxBg3', s:bg3)
call s:HL('myboxBg4', s:bg4)

call s:HL('myboxRed', s:red)
call s:HL('myboxRedBold', s:red, s:none, s:bold)
call s:HL('myboxGreen', s:green)
call s:HL('myboxGreenBold', s:green, s:none, s:bold)
call s:HL('myboxYellow', s:yellow)
call s:HL('myboxYellowBold', s:yellow, s:none, s:bold)
call s:HL('myboxBlue', s:blue)
call s:HL('myboxBlueBold', s:blue, s:none, s:bold)
call s:HL('myboxPurple', s:purple)
call s:HL('myboxPurpleBold', s:purple, s:none, s:bold)
call s:HL('myboxAqua', s:aqua)
call s:HL('myboxAquaBold', s:aqua, s:none, s:bold)
call s:HL('myboxOrange', s:orange)
call s:HL('myboxOrangeBold', s:orange, s:none, s:bold)

call s:HL('myboxRedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('myboxGreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('myboxYellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('myboxBlueSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('myboxPurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('myboxAquaSign', s:aqua, s:sign_column, s:invert_signs)

" }}}

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text
call s:HL('Normal', s:fg1, s:bg0)

" Correct background (see issue #7):
" --- Problem with changing between dark and light on 256 color terminal
" --- https://github.com/morhetz/mybox/issues/7
if s:is_dark
  set background=dark
else
  set background=light
endif

if version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine',   s:none, s:bg1)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine

  " Tab pages line filler
  call s:HL('TabLineFill', s:bg4, s:vim_bg, s:invert_tabline)
  " Active tab page label
  call s:HL('TabLineSel', s:vim_bg, s:bg4, s:bold . s:invert_tabline)
  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  call s:HL('MatchParen', s:none, s:bg3, s:bold)
endif

if version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn',  s:none, s:color_column)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:blue, s:none)

  " Line number of CursorLine
  call s:HL('CursorLineNr', s:yellow, s:bg1)
endif

hi! link NonText myboxBg2
hi! link SpecialKey myboxBg2

call s:HL('Visual',    s:none,  s:bg3, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search',    s:yellow, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bg4, s:bg0, s:bold . s:inverse)
call s:HL('StatusLineNC', s:bg2, s:fg4, s:bold . s:inverse)

" The column separating vertically split windows
call s:HL('VertSplit', s:fg4, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:blue, s:bg2, s:bold)

" Directory names, special names in listing
hi! link Directory myboxGreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title myboxGreenBold

" Error messages on the command line
call s:HL('ErrorMsg',   s:bg0, s:red, s:bold)
" More prompt: -- More --
hi! link MoreMsg myboxYellowBold
" Current mode message: -- INSERT --
hi! link ModeMsg myboxYellowBold
" 'Press enter' prompt and yes/no questions
hi! link Question myboxOrangeBold
" Warning messages
hi! link WarningMsg myboxRedBold

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:number_column)

" Column where signs are displayed
call s:HL('SignColumn', s:none, s:sign_column)

" Line used for closed folds
call s:HL('Folded', s:gray, s:bg1, s:italic)
" Column where folds are displayed
call s:HL('FoldColumn', s:gray, s:bg1)

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:none, s:none, s:inverse)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

if g:mybox_improved_strings == 0
  hi! link Special myboxOrange
else
  call s:HL('Special', s:bg1, s:orange, s:italic)
endif

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('Error', s:red, s:vim_bg, s:bold . s:inverse)

" Generic statement
hi! link Statement myboxRed
" if, then, else, endif, swicth, etc.
hi! link Conditional myboxRed
" for, do, while, etc.
hi! link Repeat myboxRed
" case, default, etc.
hi! link Label myboxRed
" try, catch, throw
hi! link Exception myboxRed
" sizeof, "+", "*", etc.
hi! link Operator Normal
" Any other keyword
hi! link Keyword myboxRed

" Variable name
hi! link Identifier myboxBlue
" Function name
hi! link Function myboxGreenBold

" Generic preprocessor
hi! link PreProc myboxAqua
" Preprocessor #include
hi! link Include myboxAqua
" Preprocessor #define
hi! link Define myboxAqua
" Same as Define
hi! link Macro myboxAqua
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit myboxAqua

" Generic constant
hi! link Constant myboxPurple
" Character constant: 'c', '/n'
hi! link Character myboxPurple
" String constant: "this is a string"
if g:mybox_improved_strings == 0
  call s:HL('String',  s:green, s:none, s:italicize_strings)
else
  call s:HL('String',  s:bg1, s:fg1, s:italicize_strings)
endif
" Boolean constant: TRUE, false
hi! link Boolean myboxPurple
" Number constant: 234, 0xff
hi! link Number myboxPurple
" Floating point constant: 2.3e10
hi! link Float myboxPurple

" Generic type
hi! link Type myboxYellow
" static, register, volatile, etc
hi! link StorageClass myboxOrange
" struct, union, enum, etc.
hi! link Structure myboxAqua
" typedef
hi! link Typedef myboxYellow

" }}}
" Completion Menu: {{{

if version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:fg1, s:bg2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bg2, s:blue, s:bold)
  " Popup menu: scrollbar
  call s:HL('PmenuSbar', s:none, s:bg2)
  " Popup menu: scrollbar thumb
  call s:HL('PmenuThumb', s:none, s:bg4)
endif

" }}}
" Diffs: {{{

call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)
"call s:HL('DiffChange', s:bg0, s:blue)
"call s:HL('DiffText',   s:bg0, s:yellow)

" Alternative setting
call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText',   s:yellow, s:bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  " Not capitalised word, or compile warnings
  if g:mybox_improved_warnings == 0
    call s:HL('SpellCap',   s:none, s:none, s:undercurl, s:red)
  else
    call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  endif
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:aqua)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:purple)
endif

" }}}

" Plugin specific -------------------------------------------------------------
" EasyMotion: {{{

hi! link EasyMotionTarget Search
hi! link EasyMotionShade Comment

" }}}
" Sneak: {{{

hi! link SneakPluginTarget Search
hi! link SneakStreakTarget Search
call s:HL('SneakStreakMask', s:yellow, s:yellow)
hi! link SneakStreakStatusLine Search

" }}}
" Indent Guides: {{{

if !exists('g:indent_guides_auto_colors')
  let g:indent_guides_auto_colors = 0
endif

if g:indent_guides_auto_colors == 0
  if g:mybox_invert_indent_guides == 0
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg1)
  else
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2, s:inverse)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg3, s:inverse)
  endif
endif

" }}}
" IndentLine: {{{

if !exists('g:indentLine_color_term')
  let g:indentLine_color_term = s:bg2[1]
endif
if !exists('g:indentLine_color_gui')
  let g:indentLine_color_gui = s:bg2[0]
endif

" }}}
" Rainbow Parentheses: {{{

if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs =
    \ [
      \ ['blue', '#458588'], ['magenta', '#b16286'],
      \ ['red',  '#cc241d'], ['166',     '#d65d0e']
    \ ]
endif

let g:rainbow_guifgs = [ '#d65d0e', '#cc241d', '#b16286', '#458588' ]
let g:rainbow_ctermfgs = [ '166', 'red', 'magenta', 'blue' ]

if !exists('g:rainbow_conf')
   let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
   let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
   let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:rbpt_colorpairs
let g:niji_light_colours = g:rbpt_colorpairs

"}}}
" GitGutter: {{{

hi! link GitGutterAdd myboxGreenSign
hi! link GitGutterChange myboxAquaSign
hi! link GitGutterDelete myboxRedSign
hi! link GitGutterChangeDelete myboxAquaSign

" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile myboxGreen
hi! link gitcommitDiscardedFile myboxRed

" }}}
" Signify: {{{

hi! link SignifySignAdd myboxGreenSign
hi! link SignifySignChange myboxAquaSign
hi! link SignifySignDelete myboxRedSign

" }}}
" Syntastic: {{{

call s:HL('SyntasticError', s:none, s:none, s:undercurl, s:red)
call s:HL('SyntasticWarning', s:none, s:none, s:undercurl, s:yellow)

hi! link SyntasticErrorSign myboxRedSign
hi! link SyntasticWarningSign myboxYellowSign

" }}}
" Signature: {{{
hi! link SignatureMarkText   myboxBlueSign
hi! link SignatureMarkerText myboxPurpleSign

" }}}
" ShowMarks: {{{

hi! link ShowMarksHLl myboxBlueSign
hi! link ShowMarksHLu myboxBlueSign
hi! link ShowMarksHLo myboxBlueSign
hi! link ShowMarksHLm myboxBlueSign

" }}}
" CtrlP: {{{

hi! link CtrlPMatch myboxYellow
hi! link CtrlPNoEntries myboxRed
hi! link CtrlPPrtBase myboxBg2
hi! link CtrlPPrtCursor myboxBlue
hi! link CtrlPLinePre myboxBg2

call s:HL('CtrlPMode1', s:blue, s:bg2, s:bold)
call s:HL('CtrlPMode2', s:bg0, s:blue, s:bold)
call s:HL('CtrlPStats', s:fg4, s:bg2, s:bold)

" }}}
" Startify: {{{

hi! link StartifyBracket myboxFg3
hi! link StartifyFile myboxFg0
hi! link StartifyNumber myboxBlue
hi! link StartifyPath myboxGray
hi! link StartifySlash myboxGray
hi! link StartifySection myboxYellow
hi! link StartifySpecial myboxBg2
hi! link StartifyHeader myboxOrange
hi! link StartifyFooter myboxBg2

" }}}
" Vimshell: {{{

let g:vimshell_escape_colors = [
  \ s:bg4[0], s:red[0], s:green[0], s:yellow[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg4[0],
  \ s:bg0[0], s:red[0], s:green[0], s:orange[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg0[0]
  \ ]

" }}}
" BufTabLine: {{{

call s:HL('BufTabLineCurrent', s:bg0, s:fg4)
call s:HL('BufTabLineActive', s:fg4, s:bg2)
call s:HL('BufTabLineHidden', s:bg4, s:bg1)
call s:HL('BufTabLineFill', s:bg0, s:bg0)

" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded myboxGreen
hi! link diffRemoved myboxRed
hi! link diffChanged myboxAqua

hi! link diffFile myboxOrange
hi! link diffNewFile myboxYellow

hi! link diffLine myboxBlue

" }}}
" Html: {{{

hi! link htmlTag myboxBlue
hi! link htmlEndTag myboxBlue

hi! link htmlTagName myboxAquaBold
hi! link htmlArg myboxAqua

hi! link htmlScriptTag myboxPurple
hi! link htmlTagN myboxFg1
hi! link htmlSpecialTagName myboxAquaBold

call s:HL('htmlLink', s:fg4, s:none, s:underline)

hi! link htmlSpecialChar myboxOrange

call s:HL('htmlBold', s:vim_fg, s:vim_bg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_fg, s:vim_bg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_fg, s:vim_bg, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:vim_fg, s:vim_bg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_fg, s:vim_bg, s:underline . s:italic)
call s:HL('htmlItalic', s:vim_fg, s:vim_bg, s:italic)

" }}}
" Xml: {{{

hi! link xmlTag myboxBlue
hi! link xmlEndTag myboxBlue
hi! link xmlTagName myboxBlue
hi! link xmlEqual myboxBlue
hi! link docbkKeyword myboxAquaBold

hi! link xmlDocTypeDecl myboxGray
hi! link xmlDocTypeKeyword myboxPurple
hi! link xmlCdataStart myboxGray
hi! link xmlCdataCdata myboxPurple
hi! link dtdFunction myboxGray
hi! link dtdTagName myboxPurple

hi! link xmlAttrib myboxAqua
hi! link xmlProcessingDelim myboxGray
hi! link dtdParamEntityPunct myboxGray
hi! link dtdParamEntityDPunct myboxGray
hi! link xmlAttribPunct myboxGray

hi! link xmlEntity myboxOrange
hi! link xmlEntityPunct myboxOrange
" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:fg4, s:none, s:bold . s:italicize_comments)

hi! link vimNotation myboxOrange
hi! link vimBracket myboxOrange
hi! link vimMapModKey myboxOrange
hi! link vimFuncSID myboxFg3
hi! link vimSetSep myboxFg3
hi! link vimSep myboxFg3
hi! link vimContinue myboxFg3

" }}}
" Clojure: {{{

hi! link clojureKeyword myboxBlue
hi! link clojureCond myboxOrange
hi! link clojureSpecial myboxOrange
hi! link clojureDefine myboxOrange

hi! link clojureFunc myboxYellow
hi! link clojureRepeat myboxYellow
hi! link clojureCharacter myboxAqua
hi! link clojureStringEscape myboxAqua
hi! link clojureException myboxRed

hi! link clojureRegexp myboxAqua
hi! link clojureRegexpEscape myboxAqua
call s:HL('clojureRegexpCharClass', s:fg3, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureParen myboxFg3
hi! link clojureAnonArg myboxYellow
hi! link clojureVariable myboxBlue
hi! link clojureMacro myboxOrange

hi! link clojureMeta myboxYellow
hi! link clojureDeref myboxYellow
hi! link clojureQuote myboxYellow
hi! link clojureUnquote myboxYellow

" }}}
" C: {{{

hi! link cOperator myboxPurple
hi! link cStructure myboxOrange

" }}}
" Python: {{{

hi! link pythonBuiltin myboxOrange
hi! link pythonBuiltinObj myboxOrange
hi! link pythonBuiltinFunc myboxOrange
hi! link pythonFunction myboxAqua
hi! link pythonDecorator myboxRed
hi! link pythonInclude myboxBlue
hi! link pythonImport myboxBlue
hi! link pythonRun myboxBlue
hi! link pythonCoding myboxBlue
hi! link pythonOperator myboxRed
hi! link pythonExceptions myboxPurple
hi! link pythonBoolean myboxPurple
hi! link pythonDot myboxFg3

" }}}
" CSS: {{{

hi! link cssBraces myboxBlue
hi! link cssFunctionName myboxYellow
hi! link cssIdentifier myboxOrange
hi! link cssClassName myboxGreen
hi! link cssColor myboxBlue
hi! link cssSelectorOp myboxBlue
hi! link cssSelectorOp2 myboxBlue
hi! link cssImportant myboxGreen
hi! link cssVendor myboxFg1

hi! link cssTextProp myboxAqua
hi! link cssAnimationProp myboxAqua
hi! link cssUIProp myboxYellow
hi! link cssTransformProp myboxAqua
hi! link cssTransitionProp myboxAqua
hi! link cssPrintProp myboxAqua
hi! link cssPositioningProp myboxYellow
hi! link cssBoxProp myboxAqua
hi! link cssFontDescriptorProp myboxAqua
hi! link cssFlexibleBoxProp myboxAqua
hi! link cssBorderOutlineProp myboxAqua
hi! link cssBackgroundProp myboxAqua
hi! link cssMarginProp myboxAqua
hi! link cssListProp myboxAqua
hi! link cssTableProp myboxAqua
hi! link cssFontProp myboxAqua
hi! link cssPaddingProp myboxAqua
hi! link cssDimensionProp myboxAqua
hi! link cssRenderProp myboxAqua
hi! link cssColorProp myboxAqua
hi! link cssGeneratedContentProp myboxAqua

" }}}
" JavaScript: {{{

hi! link javaScriptBraces myboxFg1
hi! link javaScriptFunction myboxAqua
hi! link javaScriptIdentifier myboxRed
hi! link javaScriptMember myboxBlue
hi! link javaScriptNumber myboxPurple
hi! link javaScriptNull myboxPurple
hi! link javaScriptParens myboxFg3

" }}}
" YAJS: {{{

hi! link javascriptImport myboxAqua
hi! link javascriptExport myboxAqua
hi! link javascriptClassKeyword myboxAqua
hi! link javascriptClassExtends myboxAqua
hi! link javascriptDefault myboxAqua

hi! link javascriptClassName myboxYellow
hi! link javascriptClassSuperName myboxYellow
hi! link javascriptGlobal myboxYellow

hi! link javascriptEndColons myboxFg1
hi! link javascriptFuncArg myboxFg1
hi! link javascriptGlobalMethod myboxFg1
hi! link javascriptNodeGlobal myboxFg1

" hi! link javascriptVariable myboxOrange
hi! link javascriptVariable myboxRed
" hi! link javascriptIdentifier myboxOrange
" hi! link javascriptClassSuper myboxOrange
hi! link javascriptIdentifier myboxOrange
hi! link javascriptClassSuper myboxOrange

" hi! link javascriptFuncKeyword myboxOrange
" hi! link javascriptAsyncFunc myboxOrange
hi! link javascriptFuncKeyword myboxAqua
hi! link javascriptAsyncFunc myboxAqua
hi! link javascriptClassStatic myboxOrange

hi! link javascriptOperator myboxRed
hi! link javascriptForOperator myboxRed
hi! link javascriptYield myboxRed
hi! link javascriptExceptions myboxRed
hi! link javascriptMessage myboxRed

hi! link javascriptTemplateSB myboxAqua
hi! link javascriptTemplateSubstitution myboxFg1

" hi! link javascriptLabel myboxBlue
" hi! link javascriptObjectLabel myboxBlue
" hi! link javascriptPropertyName myboxBlue
hi! link javascriptLabel myboxFg1
hi! link javascriptObjectLabel myboxFg1
hi! link javascriptPropertyName myboxFg1

hi! link javascriptLogicSymbols myboxFg1
hi! link javascriptArrowFunc myboxFg1

hi! link javascriptDocParamName myboxFg4
hi! link javascriptDocTags myboxFg4
hi! link javascriptDocNotation myboxFg4
hi! link javascriptDocParamType myboxFg4
hi! link javascriptDocNamedParamType myboxFg4

" }}}
" TypeScript: {{{

hi! link typeScriptReserved myboxAqua
hi! link typeScriptLabel myboxAqua
hi! link typeScriptIdentifier myboxOrange
hi! link typeScriptBraces myboxFg1
hi! link typeScriptEndColons myboxFg1
hi! link typeScriptDOMObjects myboxFg1
hi! link typeScriptAjaxMethods myboxFg1
hi! link typeScriptLogicSymbols myboxFg1
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp myboxFg3
hi! link coffeeSpecialOp myboxFg3
hi! link coffeeCurly myboxOrange
hi! link coffeeParen myboxFg3
hi! link coffeeBracket myboxOrange

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter myboxGreen
hi! link rubyInterpolationDelimiter myboxAqua

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier myboxRed
hi! link objcDirective myboxBlue

" }}}
" Go: {{{

hi! link goDirective myboxAqua
hi! link goConstants myboxPurple
hi! link goDeclaration myboxRed
hi! link goDeclType myboxBlue
hi! link goBuiltins myboxOrange

" }}}
" Lua: {{{

hi! link luaIn myboxRed
hi! link luaFunction myboxAqua
hi! link luaTable myboxOrange

" }}}
" MoonScript: {{{

hi! link moonSpecialOp myboxFg3
hi! link moonExtendedOp myboxFg3
hi! link moonFunction myboxFg3
hi! link moonObject myboxYellow

" }}}
" Java: {{{

hi! link javaAnnotation myboxBlue
hi! link javaDocTags myboxAqua
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen myboxFg3
hi! link javaParen1 myboxFg3
hi! link javaParen2 myboxFg3
hi! link javaParen3 myboxFg3
hi! link javaParen4 myboxFg3
hi! link javaParen5 myboxFg3
hi! link javaOperator myboxOrange

hi! link javaVarArg myboxGreen

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter myboxGreen
hi! link elixirInterpolationDelimiter myboxAqua

hi! link elixirModuleDeclaration myboxYellow

" }}}
" Scala: {{{

" NB: scala vim syntax file is kinda horrible
hi! link scalaNameDefinition myboxFg1
hi! link scalaCaseFollowing myboxFg1
hi! link scalaCapitalWord myboxFg1
hi! link scalaTypeExtension myboxFg1

hi! link scalaKeyword myboxRed
hi! link scalaKeywordModifier myboxRed

hi! link scalaSpecial myboxAqua
hi! link scalaOperator myboxFg1

hi! link scalaTypeDeclaration myboxYellow
hi! link scalaTypeTypePostDeclaration myboxYellow

hi! link scalaInstanceDeclaration myboxFg1
hi! link scalaInterpolation myboxAqua

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:fg3, s:none, s:italic)

hi! link markdownH1 myboxGreenBold
hi! link markdownH2 myboxGreenBold
hi! link markdownH3 myboxYellowBold
hi! link markdownH4 myboxYellowBold
hi! link markdownH5 myboxYellow
hi! link markdownH6 myboxYellow

hi! link markdownCode myboxAqua
hi! link markdownCodeBlock myboxAqua
hi! link markdownCodeDelimiter myboxAqua

hi! link markdownBlockquote myboxGray
hi! link markdownListMarker myboxGray
hi! link markdownOrderedListMarker myboxGray
hi! link markdownRule myboxGray
hi! link markdownHeadingRule myboxGray

hi! link markdownUrlDelimiter myboxFg3
hi! link markdownLinkDelimiter myboxFg3
hi! link markdownLinkTextDelimiter myboxFg3

hi! link markdownHeadingDelimiter myboxOrange
hi! link markdownUrl myboxPurple
hi! link markdownUrlTitleDelimiter myboxGreen

call s:HL('markdownLinkText', s:gray, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

" hi! link haskellType myboxYellow
" hi! link haskellOperators myboxOrange
" hi! link haskellConditional myboxAqua
" hi! link haskellLet myboxOrange
"
hi! link haskellType myboxFg1
hi! link haskellIdentifier myboxFg1
hi! link haskellSeparator myboxFg1
hi! link haskellDelimiter myboxFg4
hi! link haskellOperators myboxBlue
"
hi! link haskellBacktick myboxOrange
hi! link haskellStatement myboxOrange
hi! link haskellConditional myboxOrange

hi! link haskellLet myboxAqua
hi! link haskellDefault myboxAqua
hi! link haskellWhere myboxAqua
hi! link haskellBottom myboxAqua
hi! link haskellBlockKeywords myboxAqua
hi! link haskellImportKeywords myboxAqua
hi! link haskellDeclKeyword myboxAqua
hi! link haskellDeriving myboxAqua
hi! link haskellAssocType myboxAqua

hi! link haskellNumber myboxPurple
hi! link haskellPragma myboxPurple

hi! link haskellString myboxGreen
hi! link haskellChar myboxGreen

" }}}
" Json: {{{

hi! link jsonKeyword myboxGreen
hi! link jsonQuote myboxGreen
hi! link jsonBraces myboxFg1
hi! link jsonString myboxFg1

" }}}


" Functions -------------------------------------------------------------------
" Search Highlighting Cursor {{{

function! MyboxHlsShowCursor()
  call s:HL('Cursor', s:bg0, s:hls_cursor)
endfunction

function! MyboxHlsHideCursor()
  call s:HL('Cursor', s:none, s:none, s:inverse)
endfunction

" }}}
