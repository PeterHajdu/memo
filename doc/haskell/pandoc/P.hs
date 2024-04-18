module Main where

import Text.Pandoc
import Text.Blaze.Html.Renderer.Pretty

textToConvert = unlines [ "# Hello World."
                        , "some markdown here"
                        , "[This is a link](http://www.latermuse.com/)" ]

pandocParsed = readMarkdown def textToConvert
pandocConverted = case (writeHtml def) <$> pandocParsed of
                    Left _ -> error "unable to encode to html"
                    Right html -> renderHtml html

main :: IO ()
main = putStrLn pandocConverted
