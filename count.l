%{
#include<stdio.h>
int w=0,c=0,l=0,s=0;
%}
%%
" " {s++;}
([a-zA-Z0-9]*) {w++;c+=yyleng;} //yyleng is the length of the matched string
"\n" {l++;}
. ;
%%
int main(int argc ,char**argv)
{
   FILE *f1;
   if(argc > 1)
   {
	f1=fopen(argv[1],"r");
   if(!f1)
   {
	printf("file error\n");
	exit(1);
   }
}
yyin = f1;
yylex();
printf("words = %d\n",w);
printf("characters = %d\n",c);
printf("space = %d\n",s);
printf("lines = %d\n",l);
return 0;
}
int yywrap()
{
   return 1;
}

