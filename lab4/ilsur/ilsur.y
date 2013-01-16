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

list: zero_to_down;

f_to_down:    F;
              |f_to_down F;
              |f_to_down UMD {return(0);};
              |UMD {yyerror();return(-1);};
              |ANOTHER {yyerror();return(-1);};
              |f_to_down ANOTHER {yyerror();return(-1);};

e_to_down:   E;
              |f_to_down E;|e_to_down E;
              |e_to_down UMD {return(0);};
              |e_to_down ANOTHER {yyerror();return(-1);};

d_to_down:   D;
              |f_to_down D;|e_to_down D;|d_to_down D;
              |d_to_down UMD {return(0);};
              |d_to_down ANOTHER {yyerror();return(-1);};

c_to_down:   C;
              |f_to_down C;|e_to_down C;|d_to_down C;|c_to_down C;
              |c_to_down UMD {return(0);};
              |c_to_down ANOTHER {yyerror();return(-1);};

b_to_down:   B;
              |f_to_down B;|e_to_down B;|d_to_down B;|c_to_down B;|b_to_down B;
              |b_to_down UMD {return(0);};
              |b_to_down ANOTHER {yyerror();return(-1);};

a_to_down:   A;
              |f_to_down A;|e_to_down A;|d_to_down A;|c_to_down A;|b_to_down A;|a_to_down A;
              |a_to_down UMD {return(0);};
              |a_to_down ANOTHER {yyerror();return(-1);};

nine_to_down:   NINE;
              |f_to_down NINE;|e_to_down NINE;|d_to_down NINE;|c_to_down NINE;|b_to_down NINE;|a_to_down NINE;|nine_to_down NINE;
              |nine_to_down UMD {return(0);};
              |nine_to_down ANOTHER {yyerror();return(-1);};

eight_to_down:   EIGHT;
              |f_to_down EIGHT;|e_to_down EIGHT;|d_to_down EIGHT;|c_to_down EIGHT;|b_to_down EIGHT;|a_to_down EIGHT;|nine_to_down EIGHT;
              |eight_to_down EIGHT;
              |eight_to_down UMD {return(0);};
              |eight_to_down ANOTHER {yyerror();return(-1);};

seven_to_down:   SEVEN;
              |f_to_down SEVEN;|e_to_down SEVEN;|d_to_down SEVEN;|c_to_down SEVEN;|b_to_down SEVEN;|a_to_down SEVEN;|nine_to_down SEVEN;
              |eight_to_down SEVEN;|seven_to_down SEVEN;
              |seven_to_down UMD {return(0);};
              |seven_to_down ANOTHER {yyerror();return(-1);};

six_to_down:   SIX;
              |f_to_down SIX;|e_to_down SIX;|d_to_down SIX;|c_to_down SIX;|b_to_down SIX;|a_to_down SIX;|nine_to_down SIX;
              |eight_to_down SIX;|seven_to_down SIX;|six_to_down SIX;
              |six_to_down UMD {return(0);};
              |six_to_down ANOTHER {yyerror();return(-1);};

five_to_down:   FIVE;
              |f_to_down FIVE;|e_to_down FIVE;|d_to_down FIVE;|c_to_down FIVE;|b_to_down FIVE;|a_to_down FIVE;|nine_to_down FIVE;
              |eight_to_down FIVE;|seven_to_down FIVE;|six_to_down FIVE;|five_to_down FIVE;
              |five_to_down UMD {return(0);};
              |five_to_down ANOTHER {yyerror();return(-1);};

four_to_down:   FOUR;
              |f_to_down FOUR;|e_to_down FOUR;|d_to_down FOUR;|c_to_down FOUR;|b_to_down FOUR;|a_to_down FOUR;|nine_to_down FOUR;
              |eight_to_down FOUR;|seven_to_down FOUR;|six_to_down FOUR;|five_to_down FOUR;|four_to_down FOUR;
              |four_to_down UMD {return(0);};
              |four_to_down ANOTHER {yyerror();return(-1);};

three_to_down:   THREE;
              |f_to_down THREE;|e_to_down THREE;|d_to_down THREE;|c_to_down THREE;|b_to_down THREE;|a_to_down THREE;|nine_to_down THREE;
              |eight_to_down THREE;|seven_to_down THREE;|six_to_down THREE;|five_to_down THREE;|four_to_down THREE;|three_to_down THREE;
              |three_to_down UMD {return(0);};
              |three_to_down ANOTHER {yyerror();return(-1);};

two_to_down:   TWO;
              |f_to_down TWO;|e_to_down TWO;|d_to_down TWO;|c_to_down TWO;|b_to_down TWO;|a_to_down TWO;|nine_to_down TWO;
              |eight_to_down TWO;|seven_to_down TWO;|six_to_down TWO;|five_to_down TWO;|four_to_down TWO;|three_to_down TWO;|two_to_down TWO;
              |two_to_down UMD {return(0);};
              |two_to_down ANOTHER {yyerror();return(-1);};

one_to_down:   ONE;
              |f_to_down ONE;|e_to_down ONE;|d_to_down ONE;|c_to_down ONE;|b_to_down ONE;|a_to_down ONE;|nine_to_down ONE;
              |eight_to_down ONE;|seven_to_down ONE;|six_to_down ONE;|five_to_down ONE;|four_to_down ONE;|three_to_down ONE;|two_to_down ONE;|one_to_down ONE;
              |one_to_down UMD {return(0);};
              |one_to_down ANOTHER {yyerror();return(-1);};

zero_to_down:   ZERO;
              |f_to_down ZERO;|e_to_down ZERO;|d_to_down ZERO;|c_to_down ZERO;|b_to_down ZERO;|a_to_down ZERO;|nine_to_down ZERO;
              |eight_to_down ZERO;|seven_to_down ZERO;|six_to_down ZERO;|five_to_down ZERO;|four_to_down ZERO;|three_to_down ZERO;|two_to_down ZERO;|one_to_down ZERO;|zero_to_down ZERO;
              |zero_to_down UMD {return(0);};
              |zero_to_down ANOTHER {yyerror();return(-1);};

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