 module Main where


import Options
import Network.HTTP
import Data.Bool
import Data.Either
import Control.Concurrent
import Control.Exception


data MainOptions = MainOptions { delay :: Int }


instance Options MainOptions where
  defineOptions = MainOptions
    <$> defineOption
          optionType_int
          (\o -> o { optionLongFlags = ["delay"]
                   , optionShortFlags = ['d']
                   , optionDescription = "How long to wait between requests (seconds)"
                   , optionDefault = 30
                   })


wait :: Int -> IO ()
wait = threadDelay . (* 1000000)


getPage :: String -> IO (Maybe String)
getPage = cio . fmap (either (return . show) (const Nothing)) . simpleHTTP . getRequest
  where
    cio = handle (\e -> return $ return $ show (e :: IOException))


main :: IO ()
main = runCommand main'
  where
    main' (MainOptions { delay = delay }) [url] =
      loopFunc
      where
        outputFail message =
          putStrLn (
            "Server on '" ++ url ++ "' is not reachable (Error: " ++ message ++ ").\n \
            \Trying again in " ++ show delay ++ " seconds."
            )
        outputSuccess = putStrLn $ "Sucessfully reached server '" ++ url ++ "' terminating program"
        failFunc message = do
          outputFail message
          wait delay
          loopFunc
        gp = getPage url
        loopFunc =
          gp >>=
            maybe
              outputSuccess
              failFunc
    main' _ _ = putStrLn "Need one argument with the server to call"
