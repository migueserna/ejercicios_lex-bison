%{
#include <stdio.h>
#include <stdlib.h>
%}

%token OR AND NOT TRUE FALSE
%left OR
%left AND
%right NOT

%%

start: expr { $$ = $1; }

expr: bexpr {
        $$ = $1;
        printf("Resultado es: %s\n", $$ ? "verdadero" : "falso");
        exit(0);
      }

bexpr: bterm
     | bexpr OR bterm   { $$ = $1 || $3; }
     ;

bterm: bfactor
     | bterm AND bfactor { $$ = $1 && $3; }
     ;

bfactor: NOT bfactor    { $$ = !$2; }
       | '(' bexpr ')'  { $$ = $2; }
       | TRUE           { $$ = 1; }
       | FALSE          { $$ = 0; }
       ;

%%

%%
int yylex();
void yyerror(const char*);
int result;
%%

int main() {
    yyparse();
    return 0;
}

void yyerror(const char* mensage) {
    fprintf(stderr, "Error, expresion booleana invalida: %s\n", mensage);
    exit(1);
}
