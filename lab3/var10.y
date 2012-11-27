%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#define YYSTYPE char *
#include "lex.yy.c"

%}

%token POINT NUMBER EXP SIGN
%start needLine

%%
needLine:
lineWithPoint
|
lineWithoutPoint
;

signedNumber:
SIGN NUMBER 
{
    strncat($$,$2,strlen($2));
}
|
NUMBER
{
    $$=$1;
}
;

lineWithPoint: signedNumber POINT NUMBER EXP signedNumber
{
    printf("%se%s\n",$1,$5);
}
;

lineWithoutPoint: signedNumber EXP signedNumber
{
    printf("%se%s\n",$1,$3);
}
;
%%

yyerror(const char *str){
    printf("Yacc: Error\n");
}

yywrap(){return 1;}
main(){yyparse();}