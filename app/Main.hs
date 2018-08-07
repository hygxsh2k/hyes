module Main where

import           Options.Applicative

import           Lib

data Options = Options
    { optVersion  :: Bool
    , optArgument :: String
    } deriving Show

versionP :: Parser Bool
versionP = switch $ short 'v' <> long "version" <> help "Show hyes version"

argumentP :: Parser String
argumentP = argument str $ metavar "STRING" <> value "y"

optionsP :: Parser Options
optionsP = helper <*> (Options <$> versionP <*> argumentP)

myParserInfo :: ParserInfo Options
myParserInfo = info optionsP $ fullDesc
    <> header "hyes - Haskell implementation of yes"

main :: IO ()
main = do
    options <- execParser myParserInfo
    if optVersion options
        then showVersion
        else hYes $ optArgument options

showVersion :: IO ()
showVersion = putStrLn "Version 0.1.0.0"
