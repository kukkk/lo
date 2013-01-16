ZERO [0]*
ONE [1]*
TWO [2]*
THREE [3]*
FOUR [4]*
FIVE [5]*
SIX [6]*
SEVEN [7]*
EIGHT [8]*
NINE [9]*
A ['A']*
B ['B']*
C ['C']*
D ['D']*
E ['E']*
F ['F']*
ANOTHER [^0-9ABCDEF'\n']+
UMD ['\n']

%START to_up

%{
#include <stdio.h>
%}

%%

<to_up>{UMD} {printf("Success\n"); return(0);};
<to_up>{F}{E}{D}{C}{B}{A}{NINE}{EIGHT}{SEVEN}{SIX}{FIVE}{FOUR}{THREE}{TWO}{ONE}{ZERO} {printf("Error\n"); return(0);};
<to_up>{ANOTHER} {printf("Error\n"); return(0);};

^{UMD}|{ANOTHER} {printf("Error\n"); return(0);};
^{ZERO}{ONE}{TWO}{THREE}{FOUR}{FIVE}{SIX}{SEVEN}{EIGHT}{NINE}{A}{B}{C}{D}{E}{F} {BEGIN to_up;};

%%