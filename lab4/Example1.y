%{
#include<stdio.h>
%}
%%
a: '0' a
a: '0' b
b: '1' b
b: '1' r
r: ;
%%
int yylex(){
	int c = getchar();
	if(c=='\n') c=0; 
	return(c);
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
