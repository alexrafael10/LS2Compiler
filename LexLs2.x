{

module LexLs2 (
	Token(..),
	lexer
) where
}

%wrapper "basic"

$digit  = [0-9]
$letter = [a-zA-Z]
$lower = [a-z]
$upper = [A-Z]
$any = [.]

tokens :-
	\n														 				{ \s -> TkLin}
	$white+                        				;
	Titulo:\ $any*\.					 		 	 				{ \s -> TkTit (take_title s)}
	Comentarios\n$any*\n 						 			;
	Gramatica	| Condiciones | Fin					{ \s -> TkSecc s}
	parametro | valor | simbolo |
	pasos | angulo | posicion | matriz |
	generatriz | probabilidad 					  { \s -> TkRes s}
	Real | Entero												  { \s -> TkTipo s}
	[$digit]+														  { \s -> TkEnt ( read s)}
	[$digit]+\.[$digit]+							    { \s -> TkReal (read s)}
	$lower[$digit $letter]*               { \s -> TkIdPar s}
	$upper[$digit]*												{ \s -> TkIdSim s}
	\( | \) | \, | \:											{ \s -> TkSep1 s}
	\{ | \} | \-\- | \-\>	| \:\=					{ \s -> TkSep2 s}
	\# | \@ | \$ | \&											{ \s -> TkMov s}
	\+ | \- | \* | \\	| \^								{ \s -> TkOper s}
	\< | \> | \=													{ \s -> TkOrd s}
{

data Token
	= TkLin
	|	TkTit String
	| TkSecc String
	| TkRes String
	| TkTipo String
	| TkEnt Int
	| TkReal Float
	| TkIdPar String
	| TkIdSim String
	| TkSep1 String
	| TkSep2 String
	| TkMov String
	| TkOper String
	| TkOrd String
	deriving Show

lexer :: String -> [Token]
lexer s = alexScanTokens s

take_title :: String -> String --Mejor opcion para esto(buscar)
take_title (x:xs) = if (x == ':') then xs
	else take_title(xs)
}
