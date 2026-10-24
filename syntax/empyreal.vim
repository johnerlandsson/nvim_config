" Vim syntax file
" Language:  Empyreal automation language (in-game cartridge programs)
" Source:    ~/dev/empyreal/packages/game/src/lang (lexer.ts, parser.ts),
"            actions and events from content/game/*.yaml

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments: ';' to end of line
syn keyword empTodo contained TODO FIXME XXX NOTE
syn match   empComment ";.*$" contains=empTodo,@Spell

" Strings: double quotes, no escapes, single line
syn region  empString start=+"+ end=+"+ oneline contains=@Spell

" Numbers with optional unit: 90%  5km  30s  10m  2h  30kg  1.5  .5
syn match   empNumber "\<\d\+\%(\.\d\+\)\=\%(%\|\%(km\|kg\|s\|m\|h\)\>\)\="
syn match   empNumber "\.\d\+\%(%\|\%(km\|kg\|s\|m\|h\)\>\)\="

" Keywords (parser.ts KEYWORDS, plus setting/say/command)
syn keyword empStatement    log send reply say return retry stop
syn keyword empConditional  if elif else
syn keyword empRepeat       for in
syn keyword empOperatorWord and or not
syn keyword empBoolean      true false yes no
syn keyword empConstant     none

" Declarations
syn match   empProgram  "^\s*program\>" nextgroup=empProgName skipwhite
syn match   empProgName contained "\h\w*"

syn match   empDef      "^\s*def\>" nextgroup=empFuncName skipwhite
syn match   empFuncName contained "\h\w*"

syn match   empSetting  "^\s*setting\>" nextgroup=empSetName skipwhite
syn match   empSetName  contained "\h\w*"
syn match   empSetType  "\%(^\s*setting\s\+\h\w*\s*:\s*\)\@<=\h\w*"

syn match   empTimer    "^\s*\%(every\|after\)\>"

" Handlers: on <event> / on message(...) / on command <name> / on <value> >= x
syn match   empOn       "^\s*on\>" nextgroup=empCommandKw,empEvent skipwhite
syn match   empCommandKw contained "command\>" nextgroup=empEvent skipwhite
syn match   empEvent    contained "\h\w*"

" The handler's event and its fields
syn match   empEventVar "\<event\>\%(\.\h\w*\)\="

" Built-in functions
syn keyword empBuiltin  abs min max valid len first pop push best nearest
syn keyword empBuiltin  filter avg next_lane places
syn match   empBuiltin  "\<place\ze\s*("

" Actions (verbs) a program can issue
syn keyword empAction   ask assay bid bleed buy capture cook cut dock draw
syn keyword empAction   ease empty feed fill flush flux get go harvest hold
syn keyword empAction   ignore irrigate isolate jettison jump make mine move
syn keyword empAction   plant prioritize pull put rcs refine refuel restart
syn keyword empAction   rezero run scan scrape sell slow speed stir swap
syn keyword empAction   target tend throttle transfer travel undock vent whisk

" Operators
syn match   empOperator "==\|!=\|<=\|>=\|[<>=+\-*/]\|\.\."

hi def link empTodo         Todo
hi def link empComment      Comment
hi def link empString       String
hi def link empNumber       Number
hi def link empStatement    Statement
hi def link empConditional  Conditional
hi def link empRepeat       Repeat
hi def link empOperatorWord Operator
hi def link empOperator     Operator
hi def link empBoolean      Boolean
hi def link empConstant     Constant
hi def link empProgram      Keyword
hi def link empProgName     Title
hi def link empDef          Keyword
hi def link empFuncName     Function
hi def link empSetting      Keyword
hi def link empSetName      Identifier
hi def link empSetType      Type
hi def link empTimer        Repeat
hi def link empOn           Keyword
hi def link empCommandKw    Keyword
hi def link empEvent        Type
hi def link empEventVar     Special
hi def link empBuiltin      Function
hi def link empAction       Statement

let b:current_syntax = "empyreal"
