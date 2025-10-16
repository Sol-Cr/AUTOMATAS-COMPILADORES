%option noyywrap
%{
	#include <stdio.h>
%}

TOKEN_RFC [A-Z]{3,4}[0-9]{6}[A-Z0-9]{3}

%%
{TOKEN_RFC} { printf("TOKEN_RFC=%s\n", yytext); }

%%
int main()
{
	yylex();
	return 0;
}

