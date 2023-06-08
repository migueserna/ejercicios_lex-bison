%{
#include "analizador_booleano.tab.h"
%}

%%

or      { return OR; }
and     { return AND; }
not     { return NOT; }
true    { return TRUE; }
false   { return FALSE; }
"("     { return '('; }
")"     { return ')'; }
\n      { return 0; }  /* ignora los saltos de línea, devuelve 0  */
.       { /* Ignorar cualquier carácter no reconocido. */ }

%%

int yywrap() {
    return 1;  /* devuelve 1 lo que dice que es el final del análisis. */
}
