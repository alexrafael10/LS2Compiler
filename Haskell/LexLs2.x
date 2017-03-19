{

module LexLs2 (
 Token(..),
 AlexPosn(..),
 token_posn,
 lexer
) where
}

%wrapper "posn"

$digit  =           [0-9]
$letter =           [a-zA-Z]
$lower =            [a-z]
$upper =            [A-Z]
$any =              [.]

@seccLine =         \n\n
@title =            Titulo:\ $any*\.
@comments =         Comentarios\n$any*\n
@section =          Gramatica | Condiciones | Fin
@keyword =          parametro | valor | simbolo |
                    pasos | angulo | posicion | matriz |
                    generatriz | probabilidad
@dtype =            Real | Entero
@int_const =        [$digit]+
@float_const =      [$digit]+\.[$digit]+
@par_id =           $lower[$digit $letter]*
@sim_id =           $upper[$digit]*
@sep_1 =            \( | \) | \, | \:
@sep_2 =            \{ | \} | \-\- | \-\> | \:\=
@mov =              \# | \@ | \$ | \&
@oper =             \+ | \- | \* | \\ | \^
@ord =              \< | \> | \=

tokens :-
  @seccLine         { tok(\p s -> TkLin p)}
  $white+           ;
  @title            { tok(\p s -> TkTit p (take_title s))}
  @comments         ;
  @section          { tok(\p s -> TkSecc p s)}
  @keyword          { tok(\p s -> TkRes p s)}
  @dtype            { tok(\p s -> TkTipo p s)}
  @int_const        { tok(\p s -> TkEnt p ( read s))}
  @float_const      { tok(\p s -> TkReal p (read s))}
  @par_id           { tok(\p s -> TkIdPar p s)}
  @sim_id           { tok(\p s -> TkIdSim p s)}
  @sep_1            { tok(\p s -> TkSep1 p s)}
  @sep_2            { tok(\p s -> TkSep2 p s)}
  @mov              { tok(\p s -> TkMov p s)}
  @oper             { tok(\p s -> TkOper p s)}
  @ord              { tok(\p s -> TkOrd p s)}
  .                 { tok(\p s -> TkErr p s)}
{

tok f p s = f p s

data Token
 = TkLin AlexPosn
 | TkTit AlexPosn String
 | TkSecc AlexPosn String
 | TkRes AlexPosn String
 | TkTipo AlexPosn String
 | TkEnt AlexPosn Int
 | TkReal AlexPosn Float
 | TkIdPar AlexPosn String
 | TkIdSim AlexPosn String
 | TkSep1 AlexPosn String
 | TkSep2 AlexPosn String
 | TkMov AlexPosn String
 | TkOper AlexPosn String
 | TkOrd AlexPosn String
 | TkErr AlexPosn String
 deriving Show

lexer :: String -> [Token]
lexer s = alexScanTokens s

tk :: String -> String --Tomar Espacios restantes del titulo
tk (x:xs) = if (x == ' ') then tk(xs) else x:xs

take_title :: String -> String --Tomar titulo hasta ' '
take_title x = tk (dropWhile (/= ' ') x)

token_posn (TkLin p) = p
token_posn (TkTit p _) = p
token_posn (TkSecc p _) = p
token_posn (TkRes p _) = p
token_posn (TkTipo p _) = p
token_posn (TkEnt p _) = p
token_posn (TkReal p _) = p
token_posn (TkIdPar p _) = p
token_posn (TkIdSim p _) = p
token_posn (TkSep1 p _) = p
token_posn (TkSep2 p _) = p
token_posn (TkMov p _) = p
token_posn (TkOper p _) = p
token_posn (TkOrd p _) = p
token_posn (TkErr p _) = p
}
