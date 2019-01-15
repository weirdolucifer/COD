# Static and Dynamic Linking 

http://cs-fundamentals.com/c-programming/static-and-dynamic-linking-in-c.php

```bash
gcc -Wall -fPIC -c add.c
gcc -Wall -fPIC -c sub.c 
```

```bash
gcc -shared -o libheymath.so add.o sub.o //creating shared library
```
Wall enables warnings for many common errors.
copy the library into one of the standard directories (/usr/lib) using nautilus
```bash
ldconfig
gcc -c add1.c
gcc -o add1 add1.o libheymath.so
```



## Preprocessor:
```bash
gcc -E add1.c
```
preprocessor removes comments,insulate files and expands macros.It stores file with (.i) extension and feed to compiler. for more details https://www.geeksforgeeks.org/preprocessor-works-c/



## Flex (Fast Lexical Analyzer Generator )
file extention (.l or .lex) 
```bash
lex test.l
gcc lex.yy.c
./a.out
```

