%option noyywrap
%{
	#include <stdio.h>
%}

TOKEN_EMAIL [a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.edu\.mx

%%
{TOKEN_EMAIL} { printf("TOKEN_EMAIL=%s\n", yytext); }

%%
int main()
{
	yylex();
	return 0;
}
