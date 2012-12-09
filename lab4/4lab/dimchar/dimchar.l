ZERO [0]
ONE [1]
ANOTHER [^01'\n']+
UMD ['\n']

%START oneZero_oneOne oneZero_twoOne oneZero_threeOne twoZero_oneOne twoZero_twoOne twoZero_threeOne

%{
#include <stdio.h>
%}

%%
<oneZero_threeOne>{ZERO} {BEGIN twoZero_threeOne;};
<twoZero_threeOne>{ZERO} {BEGIN oneZero_threeOne;};
<oneZero_twoOne>{ZERO} {BEGIN twoZero_twoOne;};
<twoZero_twoOne>{ZERO} {BEGIN oneZero_twoOne;};
<oneZero_oneOne>{ZERO} {BEGIN twoZero_oneOne;};
<twoZero_oneOne>{ZERO} {BEGIN oneZero_oneOne;};
<twoZero_oneOne>{ONE} {BEGIN twoZero_twoOne;};
<twoZero_twoOne>{ONE} {BEGIN twoZero_threeOne;};
<twoZero_threeOne>{ONE} {BEGIN twoZero_oneOne;};
<oneZero_oneOne>{ONE} {BEGIN oneZero_twoOne;};
<oneZero_twoOne>{ONE} {BEGIN oneZero_threeOne;};
<oneZero_threeOne>{ONE} {BEGIN oneZero_oneOne;};

<oneZero_threeOne,oneZero_twoOne,oneZero_oneOne,twoZero_twoOne,twoZero_oneOne>{UMD} {printf("Error\n"); return(0);};
<oneZero_threeOne,oneZero_twoOne,oneZero_oneOne,twoZero_twoOne,twoZero_oneOne,twoZero_threeOne>{ANOTHER} {printf("Error\n"); return(0);};

<twoZero_threeOne>{UMD} {printf("Success\n"); return(0);}
^{ZERO} {BEGIN oneZero_threeOne;};
^{ONE} {BEGIN twoZero_oneOne;};
^{ANOTHER} {printf("Error\n"); return(0);};
%%
// ANOTHER [^01'\n']+