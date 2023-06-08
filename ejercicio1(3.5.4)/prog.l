c[a-zA-Z]
vowel[aeiouAEIOU]
cons[^aeiouAEIOU]
%%
{vowel}{c}* {
            /* First character is vowel */
            /* copy yytext into an array and append "ay" to it */
            char s[100];
            strcpy(s,yytext);
            strcat(s,"ay");
            printf("%s ",s);
            fprintf(yyout,"%s",s);
            }

{c}{c}* {
            char s[100];
            strcpy(s,yytext+1);
            printf("%s%cay ",s,yytext[0]);
            fprintf(yyout,"%s%cay",s,yytext[0]);
            }
%%
int main(){
            printf("El resultado es : \n");
            yyin = fopen("archivo_entrada.txt","r");
            yyout = fopen("archivo_salida1.txt","w");
            yylex();
            printf("\n\n\n\n\n");
            fclose(yyin);
            fclose(yyout);
            yyin = fopen("archivo_salida1.txt","r");
            yyout = fopen("archivo_salida2.txt","w");
            yylex();
            printf("\n");
            return 0;
}
