%{
	#include <stdlib.h>
	#include <stdio.h>
	#include "zoomjoystrong.h" 
%}
%token END
%token END_STATEMENT
%%
end: 	END END_STATEMENT{ 
		finish();
		exit(0);};
%%

int main(int argc, char** argv){
	yyparse();
	return 0;
}

