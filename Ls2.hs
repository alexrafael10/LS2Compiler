module Main where

import System.IO
import System.Environment
import LexLs2

main = do
       (file:xs) <- getArgs
       s <- readFile file
       (putStrLn . show . lexer) s
