%{

#include <stdio.h>
#include <string.h>

void yyerror(){printf("Error\n");}
yywrap(){return(1);}

main(){
if(yyparse()==0)
  printf("Success\n");
return 0;
}

%}

%token ZERO ONE UMD ANOTHER
%start list

%%

list: only_Zero;
      |only_One;

only_One: ONE;
          |only_One ONE;
          |only_One UMD {return(0);};
          |only_One ANOTHER {yyerror();return(-1);};
          |only_One ZERO {yyerror();return(-1);};

only_Zero: ZERO;
          |only_Zero ZERO;
          |only_Zero UMD {return(0);};
          |only_Zero ANOTHER {yyerror();return(-1);};
          |only_Zero ONE {yyerror();return(-1);};

%%

int yylex()
{
  int c;
  do
  {
    c = getchar();
        switch(c)
        {
          case '0': 
                return(ZERO);
          case '1':
                return(ONE);
          case EOF:
				        return(0);
          case '\n':
                return(UMD);
          default: 
                return(ANOTHER);
        }
  }
  while ((c != ' ') && (c != '\t') && (c != '\n') && (c != EOF));
  return(0);  
}

/*list: line;

line: twoZero_threeOne;

twoZero_threeOne: UND ;
          |oneZero_threeOne ZERO ;
          |twoZero_twoOne ONE ;
          |twoZero_threeOne UND {return(0);};
          |twoZero_threeOne ANOTHER {yyerror(); return(-1);};

oneZero_threeOne: ZERO ;
          |twoZero_threeOne ZERO ;
          |oneZero_twoOne ONE ;

twoZero_oneOne:   ONE ;
          |twoZero_threeOne ONE ;
          |oneZero_oneOne ZERO ;

oneZero_oneOne:   twoZero_oneOne ZERO ;
          |oneZero_threeOne ONE ;

oneZero_twoOne:   twoZero_twoOne ZERO ;
          |oneZero_oneOne ONE ;

twoZero_twoOne:   oneZero_twoOne ZERO ;
          |twoZero_oneOne ONE ;*/