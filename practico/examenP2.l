%option noyywrap
%{
#include<stdio.h>
	FILE *yyin;
int numero_comentarios = 0;
%}
TOKEN_RESERVADA (if|else|for|while|do|switch|case|break|continue|return|void|struct|sizeof|include|class|public|static|delete|namespace|default|char|int|float|double|using)
TOKEN_TIPO (int|float|char|double|long|short|unsigned|signed)
TOKEN_VAR [a-zA-Z_][a-zA-Z0-9_]*
TOKEN_NUMERO [0-9]+(\.[0-9]+)?
TOKEN_ARIT (\+|\-|\*|\/|%)
TOKEN_LOGICO (&&|\|\||!)
TOKEN_SIMBOLO [(){};,<>=]
TOKEN_COMENTARIO (\/\/.*|\/\*([^*]|\*+[^*/])*\*\/)


%%
{TOKEN_RESERVADA} { printf("PALABRA_RESERVADA=%s\n", yytext); } 
{TOKEN_VAR}         { printf("VARIABLE=%s\n", yytext); }
{TOKEN_NUMERO}      { printf("CONSTANTE NUMERICA: %s\n", yytext); }
{TOKEN_ARIT}        { printf("OPERADOR ARITMETICO: %s\n", yytext); }
{TOKEN_LOGICO}      { printf("OPERADOR LOGICO: %s\n", yytext); }
{TOKEN_SIMBOLO}     { printf("SIMBOLO ESPECIAL: %s\n", yytext); }
{TOKEN_COMENTARIO}  { numero_comentarios++; printf("COMENTARIO: %s\n", yytext); } 
%%

int main()
{
    FILE *file_7;
    char name[] = "codigo.txt";
    file_7 = fopen(name, "r");

    if (!file_7){
        printf("Ocurrio un error al abrir el archivo.\n");
        return 1;
    }
    yyin = file_7;
    yylex();
    fclose(file_7);

    printf("\nNúmero total de comentarios: %d\n", numero_comentarios);
    
    return 0;
}
