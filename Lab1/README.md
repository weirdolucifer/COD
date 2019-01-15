Static and Dynamic Linking 
//
http://cs-fundamentals.com/c-programming/static-and-dynamic-linking-in-c.php
//
gcc -Wall -fPIC -c add.c
gcc -Wall -fPIC -c sub.c // enables warnings for many common errors
//
//
gcc -shared -o libheymath.so add.o sub.o //creating shared library

//copy the library into one of the standard directories (/usr/lib) using nautilus
ldconfig
gcc -c add1.c
gcc -o add1 add1.o libheymath.so
//
//////////////////////////////////////////////////////////////////////////////////////////


for the preprocessor:
gcc -E add1.c
preprocessor removes comments,insulate files and expands macros.It stores file with (.i) extension and feed to compiler. for more details https://www.geeksforgeeks.org/preprocessor-works-c/
//////////////////////////////////////////////////////////////////////////////////////////


Flex (Fast Lexical Analyzer Generator )
file extention (.l or .lex) 
lex test.l
gcc lex.yy.c
./a.out
///////////////////////////////////////////////////////////////////////////////////////////
