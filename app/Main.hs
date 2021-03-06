
import AST
import Eval
import Parser
import Data.Either

main :: IO ()
main = do
         let f = "test.txt"

         -- read a list of declarations 'd' from file 'f'
         d <- readFile f 

         -- run 'prog' parser to parse 'd' to obtain an AST
         let ast = runP prog d

        --  let x' = Plus (Const  10) (Const  20)
        --  let f = Fn ("x" $ Plus (Var $ "y") (Const 5))
        --  let fact = Fun ("fact" "x" $
        --                   If (Lt (Var "x") (Const  1))
        --                   (Const 1)
        --                   (Plus (Var "x") (Const  ( -1)))
        --                   )
        --  let f10 = App fact (Const 10)

         case ast of Left e  -> putStrLn $ show e   -- print parse error
                     Right x -> do 
                                  putStrLn $ show x -- print the AST 
                                --   putStrLn $ pp x   -- pretty-print the AST 
                                  putStrLn $ runD x -- eval x and print the context or eval error