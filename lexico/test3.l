%option noyywrap
%{
	#include <stdio.h>
%}

TOKEN_ID [a-zA-Z][a-zA-Z0-9_]*

%%
{TOKEN_ID} { printf("TOKEN_ID=%s\n", yytext); }

%%
int main()
{
	yylex();
	return 0;
}
