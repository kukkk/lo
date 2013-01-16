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

%token UMD ANOTHER ZERO ONE TWO THREE FOUR FIVE SIX SEVEN EIGHT NINE A B C D E F
%start list

%%

list: f_to_up;

zero_to_up:   ZERO;
              |zero_to_up ZERO;
              |zero_to_up UMD {return(0);};
              |UMD {yyerror();return(-1);};
              |zero_to_up ANOTHER {yyerror();return(-1);};
              
one_to_up:    ONE;
              |zero_to_up ONE;|one_to_up ONE;
              |one_to_up UMD {return(0);};
              |one_to_up ANOTHER {yyerror();return(-1);};

two_to_up:    TWO;
              |zero_to_up TWO;|one_to_up TWO;|two_to_up TWO;
              |two_to_up UMD {return(0);};
              |two_to_up ANOTHER {yyerror();return(-1);};

three_to_up:  THREE;
              |zero_to_up THREE;|one_to_up THREE;|two_to_up THREE;|three_to_up THREE;
              |three_to_up UMD {return(0);};
              |three_to_up ANOTHER {yyerror();return(-1);};

four_to_up:   FOUR;
              |zero_to_up FOUR;|one_to_up FOUR;|two_to_up FOUR;|three_to_up FOUR;|four_to_up FOUR;
              |four_to_up UMD {return(0);};
              |four_to_up ANOTHER {yyerror();return(-1);};

five_to_up:   FIVE;
              |zero_to_up FIVE;|one_to_up FIVE;|two_to_up FIVE;|three_to_up FIVE;|four_to_up FIVE;|five_to_up FIVE;
              |five_to_up UMD {return(0);};
              |five_to_up ANOTHER {yyerror();return(-1);};

six_to_up:    SIX;
              |zero_to_up SIX;|one_to_up SIX;|two_to_up SIX;|three_to_up SIX;|four_to_up SIX;|five_to_up SIX;|six_to_up SIX;
              |six_to_up UMD {return(0);};
              |six_to_up ANOTHER {yyerror();return(-1);};

seven_to_up:  SEVEN;
              |zero_to_up SEVEN;|one_to_up SEVEN;|two_to_up SEVEN;|three_to_up SEVEN;|four_to_up SEVEN;|five_to_up SEVEN;|six_to_up SEVEN;
              |seven_to_up SEVEN;
              |seven_to_up UMD {return(0);};
              |seven_to_up ANOTHER {yyerror();return(-1);};

eight_to_up:  EIGHT;
              |zero_to_up EIGHT;|one_to_up EIGHT;|two_to_up EIGHT;|three_to_up EIGHT;|four_to_up EIGHT;|five_to_up EIGHT;|six_to_up EIGHT;
              |seven_to_up EIGHT;|eight_to_up EIGHT;
              |eight_to_up ANOTHER {yyerror();return(-1);};

nine_to_up:   NINE;
              |zero_to_up NINE;|one_to_up NINE;|two_to_up NINE;|three_to_up NINE;|four_to_up NINE;|five_to_up NINE;|six_to_up NINE;
              |seven_to_up NINE;|eight_to_up NINE;|nine_to_up NINE;
              |nine_to_up UMD {return(0);};
              |nine_to_up ANOTHER {yyerror();return(-1);};

a_to_up:      A;
              |zero_to_up A;|one_to_up A;|two_to_up A;|three_to_up A;|four_to_up A;|five_to_up A;|six_to_up A;
              |seven_to_up A;|eight_to_up A;|nine_to_up A;|a_to_up A;
              |a_to_up UMD {return(0);};
              |a_to_up ANOTHER {yyerror();return(-1);};

b_to_up:      B;
              |zero_to_up B;|one_to_up B;|two_to_up B;|three_to_up B;|four_to_up B;|five_to_up B;|six_to_up B;
              |seven_to_up B;|eight_to_up B;|nine_to_up B;|a_to_up B;|b_to_up B;
              |b_to_up UMD {return(0);};
              |b_to_up ANOTHER {yyerror();return(-1);};

c_to_up:      C;
              |zero_to_up C;|one_to_up C;|two_to_up C;|three_to_up C;|four_to_up C;|five_to_up C;|six_to_up C;
              |seven_to_up C;|eight_to_up C;|nine_to_up C;|a_to_up C;|b_to_up C;|c_to_up C;
              |c_to_up UMD {return(0);};
              |c_to_up ANOTHER {yyerror();return(-1);};

d_to_up:      D;
              |zero_to_up D;|one_to_up D;|two_to_up D;|three_to_up D;|four_to_up D;|five_to_up D;|six_to_up D;
              |seven_to_up D;|eight_to_up D;|nine_to_up D;|a_to_up D;|b_to_up D;|c_to_up D;|d_to_up D;
              |d_to_up UMD {return(0);};
              |d_to_up ANOTHER {yyerror();return(-1);};

e_to_up:      E;
              |zero_to_up E;|one_to_up E;|two_to_up E;|three_to_up E;|four_to_up E;|five_to_up E;|six_to_up E;
              |seven_to_up E;|eight_to_up E;|nine_to_up E;|a_to_up E;|b_to_up E;|c_to_up E;|d_to_up E;|e_to_up E;
              |e_to_up UMD {return(0);};
              |e_to_up ANOTHER {yyerror();return(-1);};

f_to_up:      F;
              |zero_to_up F;|one_to_up F;|two_to_up F;|three_to_up F;|four_to_up F;|five_to_up F;|six_to_up F;
              |seven_to_up F;|eight_to_up F;|nine_to_up F;|a_to_up F;|b_to_up F;|c_to_up F;|d_to_up F;|e_to_up F;|f_to_up F;
              |f_to_up UMD {return(0);};
              |f_to_up ANOTHER {yyerror();return(-1);};

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
          case '2':
                return(TWO);
          case '3': 
                return(THREE);
          case '4':
                return(FOUR);
          case '5':
                return(FIVE);
          case '6': 
                return(SIX);
          case '7':
                return(SEVEN);
          case '8':
                return(EIGHT);
          case '9': 
                return(NINE);
          case 'A':
                return(A);
          case 'B':
                return(B);
          case 'C': 
                return(C);
          case 'D':
                return(D);
          case 'E':
                return(E);
          case 'F': 
                return(F);
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