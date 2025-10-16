%option noyywrap
%{
	#include<stdio.h>
	FILE *yyin;
%}
TOKEN_VERBO_APLICACION (aplicar|usar|demostrar|ilustrar|resolver|implementar|desarrollar|modificar|construir|ejecutar|calcular|operar)

%%
{TOKEN_VERBO_APLICACION} { printf("VERBO_APLICACION=%s\n", yytext); }

%%
int main()
{
        FILE *file_7;
	char name [] = "bloom.txt";
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