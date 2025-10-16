%option noyywrap
%{
	#include<stdio.h>
	FILE *yyin;
%}
TOKEN_VERBO_ANALIZAR (analizar|comparar|distinguir|identificar|examinar|clasificar|organizar|relacionar)
TOKEN_ADJETIVO (bueno|excelente|inteligente|rapido|eficiente|creativo|responsable)
TOKEN_CONJUNCION (y|o|pero|aunque|sin\ embargo|porque)
TOKEN_PREPOSICION (a|ante|bajo|con|contra|de|desde|en|entre|hacia|hasta|para|por|segun|sin|sobre|tras)
TOKEN_PRONOMBRE (yo|tu|el|ella|nosotros|ustedes|ellos|ellas)

%%
{TOKEN_VERBO_ANALIZAR}   { printf("VERBO_ANALIZAR=%s\n", yytext); }
{TOKEN_ADJETIVO}         { printf("ADJETIVO=%s\n", yytext); }
{TOKEN_CONJUNCION}       { printf("CONJUNCION=%s\n", yytext); }
{TOKEN_PREPOSICION}      { printf("PREPOSICION=%s\n", yytext); }
{TOKEN_PRONOMBRE}        { printf("PRONOMBRE=%s\n", yytext); }
[ \t\n]+                 {  }
.                        {  }
%%
int main()
{
        FILE *file_7;
	char name [] = "t9.txt";
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