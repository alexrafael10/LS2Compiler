{

module LexLs2 (
	Token(..),
	lexer
) where
}

%wrapper "basic"

$digit  = [0-9]
$letter = [a-zA-Z]

tokens :-
	$white+                        ;
	\n														 { \s -> TkLine}
	1.Titulo											 { \s -> TkTit}

{

data Token
	= TkLine
	|	TkTit

	deriving Show

lexer :: String -> [Token]
lexer s = alexScanTokens s
}
