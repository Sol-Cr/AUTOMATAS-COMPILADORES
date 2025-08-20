#include <stdio.h>
#include <ctype.h>
#include <string.h>

int main() {
    char cadena[200];
    
    cout<<("Ingrese una oración: ");
    fgets(cadena, sizeof(cadena), stdin);

    
    cadena[strcspn(cadena, "\n")] = 0;

   
    char *palabra = strtok(cadena, " ");
    while (palabra != NULL) {
        int tieneLetras = 0;
        int tieneNumeros = 0;

        
        for (int i = 0; i < strlen(palabra); i++) {
            if (isalpha(palabra[i])) {
                tieneLetras = 1;
            } else if (isdigit(palabra[i])) {
                tieneNumeros = 1;
            }
        }

        
        cout<<("'%s' -> ", palabra);
        if (tieneLetras && tieneNumeros) {
            cout<<("Compuesta\n");
        } else if (tieneLetras) {
            cout<<("Palabra\n");
        } else if (tieneNumeros) {
            cout<<("Número\n");
        } else {
            cout<<("No clasificada\n");
        }

        palabra = strtok(NULL, " "); 
    }

    return 0;
}
