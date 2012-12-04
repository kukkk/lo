%{
#include<stdio.h>
%}
%%
s: p '\n' {return(0);}
p: p '1'
p: p '1' 'q'
q: '0' | 'q' '0'
%%
int yylex(){
	return(getchar());
}

int yyerror(char *s){
	printf("%s\n",s);
	return(1);
}

int main(int argc, char* argv[]){
	int ret;
	if((ret=yyparse())==0)
		puts("Correct binset");
	return(ret);
}
