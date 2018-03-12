/* @author Brendan Warnick
CIS 343 Winter 2018
Parsing file for zjs
Used sample code from class for help
*/

%{
	#include <stdlib.h>
	#include <stdio.h>
	#include "zoomjoystrong.h"
	void yyerror(const char* msg); 
%}
%union{ int i; float f; }

%token END
%token END_STATEMENT
%token POINT 
%token LINE
%token CIRCLE
%token RECTANGLE 
%token SET_COLOR
%token <i> INT
%token <f> FLOAT
%%
program:	zjs_list END END_STATEMENT		{ finish(); return 0; }
	|	END END_STATEMENT			{ finish(); return 0; }
;
zys_list: 	zjs | zjs zjs_list
;
zjs:		line | point | circle | rectangle | set_color
;
point:		POINT INT INT END_STATEMENT		{ point($2, $3); }
;
line: 		LINE INT INT INT INT END_STATEMENT	{ line($2, $3, $4, $5); }
;
circle: 	CIRCLE INT INT INT END_STATEMENT 	{ circle($2, $3, $4); }
;
rectangle: 	RECTANGLE INT INT INT INT END_STATEMENT	{ rectangle($2, $3, $4, $5); }
;
set_color: 	SET_COLOR INT INT INT END_STATEMENT	{ set_color($2, $3, $4); }
;

%%

int main(int argc, char** argv){
	setup();
	yyparse();
	return 0;
}
void yyerror(const char* msg){ 
	fprintf(stderr, "ERROR! %s\n", msg);
}
