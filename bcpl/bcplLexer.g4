// $antlr-format alignTrailingComments true, columnLimit 150, maxEmptyLinesToKeep 1, reflowComments false, useTab false
// $antlr-format allowShortRulesOnASingleLine true, allowShortBlocksOnASingleLine true, minEmptyLines 0, alignSemicolons ownLine
// $antlr-format alignColons trailing, singleLineOverrulesHangingColon true, alignLexerCommands true, alignLabels true, alignTrailers true

lexer grammar bcplLexer;

ACEQ         : '&:=';
AND          : '&';
ARROW        : '->';
AT           : '@';
BANG         : '!';
CB           : '$)' | '}';
CC           : '::';
CEQ          : ':=';
COLON        : ':';
COMMA        : ',';
DASH         : '-';
DD           : '..';
DOT          : '.';
EQ           : '=';
Eqv          : 'EQV';
EQVCEQ       : 'EQV:=';
GE           : '>=';
GG           : '>>';
GT           : '>';
KABS         : 'ABS';
KAND         : 'AND';
KBE          : 'BE';
KBREAK       : 'BREAK';
KBY          : 'BY';
KCASE        : 'CASE';
KDEFAULT     : 'DEFAULT';
KDO          : 'DO';
KELSE        : 'ELSE';
KENDCASE     : 'ENDCASE';
KEQ          : 'EQ';
KEVERY       : 'EVERY';
KEXIT        : 'EXIT';
KFALSE       : 'FALSE';
KFINISH      : 'FINISH';
KFIX         : 'FIX';
KFLOAT       : 'FLOAT';
KFLT         : 'FLT';
KFOR         : 'FOR';
KGET         : 'GET';
KGLOBAL      : 'GLOBAL';
KGOTO        : 'GOTO';
KIF          : 'IF';
KINTO        : 'INTO';
KLET         : 'LET';
KLOOP        : 'LOOP';
KMANIFEST    : 'MANIFEST';
KMATCH       : 'MATCH';
KMOD         : 'MOD';
KNE          : 'NE';
KNEXT        : 'NEXT';
KNOT         : 'NOT';
KOF          : 'OF';
KOR          : 'OR';
KREPEAT      : 'REPEAT';
KREPEATUNTIL : 'REPEATUNTIL';
KREPEATWHILE : 'REPEATWHILE';
KRESULTS     : 'RESULTIS';
KRETURN      : 'RETURN';
KSECTION     : 'SECTION';
KSLCT        : 'SLCT';
KSTATIC      : 'STATIC';
KSWITCHON    : 'SWITCHON';
KTEST        : 'TEST';
KTHEN        : 'THEN';
KTO          : 'TO';
KTRUE        : 'TRUE';
KUNLESS      : 'UNLESS';
KUNTIL       : 'UNTIL';
KVALOF       : 'VALOF';
KVEC         : 'VEC';
KWHILE       : 'WHILE';
KXOR         : 'XOR';
LBR          : '[';
LE           : '<=';
LL           : '<<';
LLCEQ        : '<<:=';
LP           : '(';
LT           : '<';
MODCEQ       : 'MOD:=';
NCEQ         : '~:=';
NE           : '~=';
Neqv         : 'NEQV';
NEQVCEQ      : 'NEQV:=';
OB           : '$(' | '{';
PABS         : '#ABS';
PARROW       : '#->';
PCEQ         : '#:=';
PDD          : '#..';
PE           : '#=';
PERCENT      : '%';
PGE          : '#>=';
PGT          : '#>';
PLCEQ        : '+:=';
PLE          : '#<=';
PLT          : '#<';
PLUS         : '+';
PMINUS       : '#-';
PMOD         : '#MOD';
PMODCEQ      : '#MOD:=';
PNCEQ        : '#~:=';
PNE          : '#~=';
POP          : '#(';
PPCEQ        : '#+:=';
PPLUS        : '#+';
PREM         : '#REM';
PSCEQ        : '#*:=';
PSLCEQ       : '#/:=';
PSTAR        : '#*';
QM           : '?';
RBR          : ']';
REM          : 'REM';
RP           : ')';
RRCEQ        : '>>:=';
SCEQ         : '*:=';
SEMI         : ';';
SLASH        : '/';
SLCEQ        : '/:=';
STAR         : '*';
Table        : 'TABLE';
TILDE        : '~';
VBAR         : '|';
VCEQ         : '|:=';
XORCEQ       : 'XOR:=';

Identifier: Letter (Letter | Digit | '.' | '_')*;

Binary_number      : ('#B' | '#b') [01]+;
Character_constant : '\'' '*'? . '\'';
Comment            : ('/*' .*? '*/' | '//' ~('\n' | '\r')*) -> channel(HIDDEN);
Digits             : Digit+;
Hex_number         : ('#X' | '#x') Hex_digit Hex_digit*;
Octal_number       : '#' Octal_digit Octal_digit*;
String_constant    : '"' ~'"'* /* 255 or fewer characters */ '"';
WS                 : [ \t]+  -> channel(HIDDEN);
NL                 : [\n\r]+ -> channel(2);

fragment Letter      : [a-zA-Z];
fragment Octal_digit : [0-7];
fragment Hex_digit   : [0-9A-Fa-f];
fragment Digit       : [0-9];