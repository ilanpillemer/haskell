import Data.Char
import Data.List
import Control.Arrow

-- &&& see http://hackage.haskell.org/package/base-4.14.0.0/docs/Control-Arrow.html
-- Fanout: send the input to both argument arrows and combine their output.

type Text  = [Char]

sortWords :: Ord a => [a] -> [a]
sortWords = sort

countRuns :: [String] -> [(Int,String)]
countRuns = map (length &&& head) . group

sortRuns :: [(Int,String)] -> [(Int,String)]
sortRuns = sortBy (flip compare)

showRun :: (Int,String) -> String
showRun (n,s) = s ++ " " ++ show n ++ "\n"

commonWords :: Int -> [Char] -> [Char]
commonWords n = concat .
                map showRun .
                take n .
                sortRuns .
                countRuns .
                sortWords .
                words .
                map toLower

main = do
       text <- getContents
       putStrLn $ commonWords 10000 text