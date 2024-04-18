module Main where

import Options.Applicative


data Command
    = Send {message :: String, key :: String}
    | Listen {listento :: String}
    deriving Show

data Options = Options Command deriving Show

main :: IO ()
main = run =<< execParser
    (parseOptions `withInfo` "Send messages on a multicast domain.")

withInfo :: Parser a -> String -> ParserInfo a
withInfo opts desc = info (helper <*> opts) $ progDesc desc

parseOptions :: Parser Options
parseOptions = Options <$> parseCommand

parseSend :: Parser Command
parseSend = Send
    <$> argument str (metavar "MESSAGE")
    <*> argument str (metavar "KEY")

parseListen :: Parser Command
parseListen = Listen
    <$> argument str (metavar "PATTERN")

parseCommand :: Parser Command
parseCommand = subparser $
  command "send"   (parseSend   `withInfo` "Send the message with a given key.") <>
  command "listen"  (parseListen  `withInfo` "Listen to messages matching the pattern.")

run :: Options -> IO ()
run = print

