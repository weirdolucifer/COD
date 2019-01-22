%{
#include <stdio.h>
%}

IDENTIFIER [a-zA-Z][a-zA-Z0-9]*|[a-zA-Z][a-zA-Z0-9]*[[[0-9]+]]
NON_IDENTIFIER ([0-9])+[A-Za-z]+
FORMAT_SPECIFIER "%"[a-zA-Z0-9]+
FILE "<"{IDENTIFIER}.h">"
COMMENT "/*"[a-zA-Z0-9 \t\n;.~!@#$%^&*()_+=<>?:"{}]*"*/"
SINGLE_LINE_COMMENT "//"[^\n]*
FUNCTION [_a-zA-Z0-9][_a-zA-Z0-9]*"("[_a-zA-Z0-9][_a-zA-Z0-9]*[","[_a-zA-Z0-9][_a-zA-Z0-9]*]*")"[;]|[_a-zA-Z0-9][_a-zA-Z0-9]*"("[.*]")"[;]
%%

"if"|"else"|"else if"|"switch"|"case" { printf("%s -----> conditional\n", yytext); }
["].*["] { printf("%s -----> string data \n", yytext); }
"for"|"while"|"do" { printf("%s -----> iterator\n", yytext); }
[0-9] {printf("%s -----> digit\n", yytext); }
([0-9])+ { printf("%s -----> number\n", yytext); }
([0-9])*"."([0-9])+ { printf("%s -----> real number\n", yytext); }
"#"|"#line"|"#undef"|"#error"|"#elif"|"#else"|"#endif"|"#if"|"#define"|"#include"|"#pragma"|"#ifndef"|"#ifdef" { printf("%s ----> preprocessor directive\n", yytext); }
[;,:()"] { printf("%s -----> delimiter\n", yytext); }
"break"|"continue"|"goto"|"printf"|"scanf"|"sprintf"|"sscanf"|"fopen"|"fwrite"|"fread"|"fclose"|"write"|"read"|"open"|"close"|"return"|"int"|"float"|"char"|"unsigned"|"signed"|"short"|"long"|"double" { printf("%s -----> keyword\n", yytext); }
{NON_IDENTIFIER} {printf("Could not process %s", yytext); }
{IDENTIFIER} { printf("%s -----> identifier\n", yytext); }
{COMMENT} { printf("%s -----> comment\n", yytext); }
{SINGLE_LINE_COMMENT} { printf("%s -----> comment\n", yytext); }
"+"|"-"|"*"|"/"|"=" { printf("%s -----> mathematical operator\n", yytext); }
"&"|"|"|"&&"|"~"|"||"|">"|"<"|">="|"<="|"==" { printf("%s -----> logical operator\n", yytext); }
"{" { printf("Block begins\n", yytext); }
"}" { printf("Block ends\n", yytext); }
{FILE} { printf("%s -----> file\n", yytext); }
"++"|"--" { printf("%s -----> unary operator\n", yytext); }
{FUNCTION} { printf("%s -----> function\n", yytext); }
{FORMAT_SPECIFIER} {printf("%s -----> format specifier\n", yytext); }


%%
int yywrap(){} 
int main(int argc, char *argv[]) 
{
    extern FILE *yyin,*yyout;
    yyin = fopen("hello.c","r");
    yyout = fopen("output.txt","w");
    yylex();
    return 0;
}
