%{
#include "y.tab.h"
#include <stdio.h>
extern YYSTYPE yylval;
%}
%%
[0-9]+ { yylval=strdup(yytext); return NUMBER; }
[-+]? { yylval=strdup(yytext); return SIGN; }
[.] return POINT;
e return EXP;
.|\n

%%