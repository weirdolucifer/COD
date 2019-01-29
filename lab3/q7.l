
%{ 
int count = 0; 
%} 

%% 
[+-]?[0-9]*         {printf("Integer");} 
[+-]?[0-9]*\.[0]*   {printf("Integer");} 
[+-]?[0-9]*\.[0-9]* {printf("Float");} 

\n {return 0;} 
%% 

int yywrap(){} 
int main(){ 

yylex(); 


return 0; 
} 

