{

module LexLs2 (
 Token(..),
 AlexPosn(..),
 token_posn,
 lexer
) where
}

%wrapper "posn"

$digit  = [0-9]
$letter = [a-zA-Z]
$lower = [a-z]
$upper = [A-Z]
$any = [.]

tokens :-
  \n\n                                    { tok(\p s -> TkLin p)}
  $white+                               ;
  Titulo:\ $any*\.                      { tok(\p s -> TkTit p (tk2 s))}
  Comentarios\n$any*\n                    ;
  Gramatica | Condiciones | Fin         { tok(\p s -> TkSecc p s)}
  parametro | valor | simbolo |
  pasos | angulo | posicion | matriz |
  generatriz | probabilidad             { tok(\p s -> TkRes p s)}
  Real | Entero                         { tok(\p s -> TkTipo p s)}
  [$digit]+                             { tok(\p s -> TkEnt p ( read s))}
  [$digit]+\.[$digit]+                  { tok(\p s -> TkReal p (read s))}
  $lower[$digit $letter]*               { tok(\p s -> TkIdPar p s)}
  $upper[$digit]*                       { tok(\p s -> TkIdSim p s)}
  \( | \) | \, | \:                     { tok(\p s -> TkSep1 p s)}
  \{ | \} | \-\- | \-\> | \:\=          { tok(\p s -> TkSep2 p s)}
  \# | \@ | \$ | \&                     { tok(\p s -> TkMov p s)}
  \+ | \- | \* | \\ | \^                { tok(\p s -> TkOper p s)}
  \< | \> | \=                          { tok(\p s -> TkOrd p s)}

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
 deriving Show

lexer :: String -> [Token]
lexer s = alexScanTokens s

tk1 :: String -> String --Tomar Espacios
tk1 (x:xs) = if (x == ' ') then tk1(xs) else x:xs

tk2 :: String -> String --Tomar titulo hasta ' '
tk2 x = dropWhile(/=' ') (dropWhile (/= ' ') x)

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
}
