grammar Math;

PLUS: '+';
MINUS: '_';
STAR: '*';
SLASH: '/';

PAREN_OPEN: '(';
PAREN_CLOSE : ')';

INT: ('-')? [0-9]+;
DOUBLE : ('-')? [0-9]+ '.' [0-9]+;

WS: [ \t\r\n] -> skip;

calc : expr+;

constant : INT | DOUBLE;

expr 
    : left=expr op=(STAR|SLASH|PLUS|MINUS) right=expr # Arithmetic
    | constant # Const
    | PAREN_OPEN expr PAREN_CLOSE # Paren
    ; 
    
//expr
//    : left=expr op=('*'|'/') right=expr # MulDiv
//    | left=expr op=('+'|'-') right=expr # AddSub
//    | constant # Const
//    | '(' expr ')' # Paren
//    ;