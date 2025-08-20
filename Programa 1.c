#include <stdio.h>
#include <ctype.h>
#include <string.h>

int main() {
    char cadena[200];
    
    cout<<("Ingrese una oración: ");
    fgets(cadena, sizeof(cadena), stdin);

    // Eliminar salto de línea si existe
    cadena[strcspn(cadena, "\n")] = 0;

    // Separar palabras
    char *palabra = strtok(cadena, " ");
    while (palabra != NULL) {
        int tieneLetras = 0;
        int tieneNumeros = 0;

        // Revisar cada carácter de la palabra
        for (int i = 0; i < strlen(palabra); i++) {
            if (isalpha(palabra[i])) {
                tieneLetras = 1;
            } else if (isdigit(palabra[i])) {
                tieneNumeros = 1;
            }
        }

        // Clasificación
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

        palabra = strtok(NULL, " "); // Siguiente palabra
    }

    return 0;
}
