/*
 [The "BSD licence"]
 Copyright (c) 2014 Adam Taylor
 All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions
 are met:
 1. Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
 2. Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.
 3. The name of the author may not be used to endorse or promote products
    derived from this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
/*
   Derived from http://sigmakee.cvs.sourceforge.net/viewvc/sigmakee/sigma/suo-kif.pdf
 */

// $antlr-format alignTrailingComments true, columnLimit 150, minEmptyLines 1, maxEmptyLinesToKeep 1, reflowComments false, useTab false
// $antlr-format allowShortRulesOnASingleLine false, allowShortBlocksOnASingleLine true, alignSemicolons hanging, alignColons hanging

grammar SUOKIF;

top_level
    : sentence* EOF
    ;

term
    : VARIABLE
    | WORD
    | STRING
    | funterm
    | NUMBER
    | sentence
    ;

argument
    : sentence
    | term
    ;

funterm
    : '(' WORD argument+ ')'
    ;

sentence
    : WORD
    | equation
    | relsent
    | logsent
    | quantsent
    | VARIABLE
    ;

equation
    : '(' '=' term term ')'
    ;

relsent
    : '(' (WORD | VARIABLE) argument+ ')'
    ;

logsent
    : '(' NOT sentence ')'
    | '(' AND sentence+ ')'
    | '(' OR sentence+ ')'
    | '(' '=' '>' sentence sentence ')'
    | '(' '<' '=' '>' sentence sentence ')'
    ;

quantsent
    : '(' FORALL '(' VARIABLE+ ')' sentence ')'
    | '(' EXISTS '(' VARIABLE+ ')' sentence ')'
    ;

NOT
    : 'not'
    ;

AND
    : 'and'
    ;

OR
    : 'or'
    ;

FORALL
    : 'forall'
    ;

EXISTS
    : 'exists'
    ;

fragment UPPER
    : [A-Z]
    ;

fragment LOWER
    : [a-z]
    ;

fragment DIGIT
    : [0-9]
    ;

fragment INITIALCHAR
    : UPPER
    | LOWER
    ;

fragment WORDCHAR
    : UPPER
    | LOWER
    | DIGIT
    | '-'
    | '_'
    ;

WORD
    : INITIALCHAR WORDCHAR*
    ;

STRING
    : '"' ~ ["\\]* '"'
    ;

VARIABLE
    : '?' WORD
    | '@' WORD
    ;

NUMBER
    : '-'? DIGIT+ ('.' DIGIT+)? EXPONENT?
    ;

fragment EXPONENT
    : 'e' '-'? DIGIT+
    ;

WHITE
    : [ \t\n\r\u000B] -> skip
    ;

COMMENT
    : ';' ~ [\r\n]* -> skip
    ;

LPAREN
    : '('
    ;

RPAREN
    : ')'
    ;

ASSIGN
    : '='
    ;

GT
    : '>'
    ;

LT
    : '<'
    ;

QUESTION
    : '?'
    ;