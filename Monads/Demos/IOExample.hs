import Data.Char (toUpper)
import System.IO
import Control.Applicative
import Data.IORef

shoutInputDo :: IO String
shoutInputDo = do
    str <- getUserInput
    return $ shout str


--      (+3)  $       9 =      12
--      (+3) <$> Just 9 = Just 12
-- Just (+3) <*> Just 9 = Just 12
shoutInputApplicative :: IO String
shoutInputApplicative = shout <$> getUserInput


-- return :: Monad m => a -> m a
shoutReturn :: String
shoutReturn = return "Hello" >>= shout


exampleIORef :: IO String
exampleIORef = do
    greeting <- newIORef "Hello"
    modifyIORef greeting shout
    readIORef greeting


readText :: IO Int 
readText = sum . map (\x -> read x::Int) . words <$> readFile "Nums.txt" 


-- "Hello" -> "HELLO!"
shout :: String -> String
shout = (map toUpper) . (++ "!")

getUserInput :: IO String
getUserInput = putChar '>' >> getLine

