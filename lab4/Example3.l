%Start T F
%{
#include<stdio.h>
char* mes[]={"Correct","Incorrect"};
%}
%%
<F>[^01] return(1);
<F>0 ;
<F>1 BEGIN T;
<T>1 ;
<T>. return(1);
<T>\n return(0);
0 BEGIN F;
.|\n return(1);
%%
int main (int argc, char* argv[]){
	int ret=yylex();
	printf("%s Bint set\n", mes[ret]);
	return(ret);
}
