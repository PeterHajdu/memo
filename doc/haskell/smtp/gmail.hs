{-# LANGUAGE OverloadedStrings #-}

import Network.HaskellNet.SMTP.SSL as SMTP
import Network.HaskellNet.Auth (AuthType(LOGIN))
import qualified Data.ByteString.Char8 as B

username = "username@gmail.com"
password = "password"
recipient = "recipient@gmail.com"

smtpTest = doSMTPSTARTTLS "smtp.gmail.com" $ \c -> do
    authSucceed <- SMTP.authenticate LOGIN username password c
    if authSucceed
      then sendPlainTextMail recipient username subject body c
      else print "Authentication error."
  where subject = "Test message"
        body    = "This is a test message"

main :: IO ()
main = do
  res <- smtpTest
  print res
  return ()
