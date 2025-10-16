%option noyywrap
%{
	#include<stdio.h>
	FILE *yyin;
%}
TOKEN_RESERVADA (if|else|for|while|do|switch|case|break|continue|return|void|struct|sizeof|include|class|public|static|delete|namespace|default)
TOKEN_TIPO (int|float|char|double|long|short|unsigned|signed)
TOKEN_VAR [a-zA-Z_][a-zA-Z0-9_]*
%%
{TOKEN_RESERVADA} { printf("PALABRA_RESERVADA=%s\n", yytext); }
{TOKEN_TIPO}      { printf("TIPO_DATO=%s\n", yytext); }
{TOKEN_VAR}       { printf("VARIABLE=%s\n", yytext); }
[ \t\n]+          { }
.                 {  }
%%
int main()
{
        FILE *file_7;
	char name [] = "t10.txt";
	file_7 = fopen(name, "r");

	if (!file_7){
	printf("Ocurrio un error al abrir el archivo.\n");
	return 1;
	}
	yyin = file_7;
	yylex();
	fclose(file_7);
	return 0;
}