#include<stdio.h>

#define SIZE 20
int main () 
{
          char non_terminal;
          char beta,alpha;
          char production[SIZE];
          int index=3;          
          printf("Enter the grammar:\n");
          scanf("%s",production);
          non_terminal=production[0];
          if(non_terminal==production[index]) {
            alpha=production[index+1];
            printf("Grammar is left recursive.\n");
            while(production[index]!=0 && production[index]!='|')
              index++;
            if(production[index]!=0) {
              beta=production[index+1];
              printf("Grammar without left recursion:\n");
              printf("%c->%c%c\'",non_terminal,beta,non_terminal);
              printf("\n%c\'->%c%c\'|E\n",non_terminal,alpha,non_terminal);
            }
            else 
              printf("Grammar can't be reduced\n");
          }
          else 
            printf("Grammar is not left recursive.\n");
          return 0;
}
