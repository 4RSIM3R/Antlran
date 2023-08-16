grammar Basic;

// parser rules 

chat : line EOF;
line : name SAYS opinion NEWLINE;
name : WORD;
opinion : TEXT;

// lexer rules
fragment A          : ('A'|'a') ;
fragment S          : ('S'|'s') ;
fragment Y          : ('Y'|'y') ;
fragment LOWERCASE  : [a-z] ;
fragment UPPERCASE  : [A-Z] ;

SAYS  : S A Y S ;
TEXT  : '"'.*?'"';
WORD  : (LOWERCASE | UPPERCASE)+ ;
WHITESPACE : (' '|'\t')+ -> skip ;
NEWLINE : ('\r'? '\n' | '\r')+ ;
