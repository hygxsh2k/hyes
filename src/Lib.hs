module Lib
    ( hYes
    ) where

hYes :: String -> IO ()
hYes s = putStrLn s >> hYes s
