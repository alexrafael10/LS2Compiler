{
module SyntLs2 where

  import LexLs2
}

%tokentype {Token}
%name SyntLs2
%error parseError
%lexer  {lexwrap} {EOF}

%token
  title {TkTit $$ $$}
  section {TkSecc $$ $$}

data Body =
  Title Sections

Body :  title Sections { Section [$2] }

Sections : section {Section [$1]}
         | Sections section {Section $2 : $1}
