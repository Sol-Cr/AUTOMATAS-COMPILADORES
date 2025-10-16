%option noyywrap
%{
	#include <stdio.h>
%}

TOKEN_CURP [A-Z]{4}[0-9]{6}[HM][A-Z]{5}[A-Z0-9]{2}

%%
{TOKEN_CURP} { printf("TOKEN_CURP=%s\n", yytext); }

%%
int main()
{
	yylex();
	return 0;
}
