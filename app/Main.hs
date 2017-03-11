module Main where

import Data.String.Strip

main :: IO ()
main = putStrLn $ strip "  hello world "
