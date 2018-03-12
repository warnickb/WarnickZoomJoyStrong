/*@author Brendan Warnick
CIS 343 Winter 2018
Lex file for zjs
Used class sample code for help and https://stackoverflow.com/questions/12643009/regular-expression-for-floating-point-numbers for float reg expression
*/
%{
	#include <stdio.h>
	#include "zoomjoystrong.tab.h"
%}

%%
end			{ return END; }
;			{ return END_STATEMENT; }	
point			{ return POINT; }
line 			{ return LINE; }
circle  		{ return CIRCLE; }
rectangle		{ return RECTANGLE; }
set_color		{ return SET_COLOR; }
[0-9]+ 			{ yylval.i = atoi(yytext); return INT; } 
([0-9]*[.])?[0-9]+	{ yylval.f = atoi(yytext); return FLOAT; } 
\t			;
\n			;

%%


