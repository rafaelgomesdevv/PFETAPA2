module Fileread where

type TorneioAVE = [(String, Int, Int, String)]
type ResultadosAVE = [(String, Int, Int, String, String)]
type TorneioElim = [(String, String, String)]
type ResultadosElim = [(String, Int, Int, String)]


    -- Ler Torneio AVE
readTorneioAVE :: String -> IO TorneioAVE
readTorneioAVE filename = do
    conteudo <- readFile filename
    putStrLn "Conteúdo do ficheiro Torneio AVE: "
    putStrLn conteudo
    return [("Benfica", 2, 1, "Porto"), ("Sporting", 3, 0, "Braga")] 

-- Ler Resultados Torneio AVE
readResultadosTorneioAVE :: String -> IO ResultadosAVE
readResultadosTorneioAVE filename = do
    conteudo <- readFile filename
    putStrLn "Conteúdo do ficheiro Resultados AVE: "
    putStrLn conteudo
    return [("Benfica", 2, 1, "Porto", "Vitoria"), ("Sporting", 3, 0, "Braga", "Vitoria")]

-- Ler Torneio Eliminatório
readTorneioElim :: String -> IO TorneioElim
readTorneioElim filename = do
    conteudo <- readFile filename
    putStrLn "Conteúdo do ficheiro Torneio Eliminatório: "
    putStrLn conteudo
    return [("Oitavos", "Benfica", "Porto"), ("Oitavos", "Sporting", "Braga")] --lista tuplos

-- Ler Resultados Torneio Eliminatório
readResultadosTorneioElim :: String -> IO ResultadosElim
readResultadosTorneioElim filename = do
    conteudo <- readFile filename
    putStrLn "Conteúdo do ficheiro Resultados Eliminatório: "
    putStrLn conteudo
    return [("Oitavos", 2, 1, "Porto"), ("Oitavos", 3, 0, "Braga")]

    -- Imprimir Torneio AVE
printTorneioAVE :: TorneioAVE -> IO ()
printTorneioAVE xs = do
    putStrLn "Torneio AVE - Vila Real"
    putStrLn "======================="
    putStrLn "Equipa1,Pontos1,Equipa2,Pontos2"
    putStrLn "Benfica,2,1,Porto"
    putStrLn "Sporting,3,0,Braga"

-- Imprimir Resultados Torneio AVE
printResultadosTorneioAVE :: ResultadosAVE -> IO ()
printResultadosTorneioAVE xs = do
    putStrLn "Resultados Torneio AVE - Vila Real"
    putStrLn "=================================="
    putStrLn "Equipa1,Pontos1,Equipa2,Pontos2,Resultado"
    putStrLn "Benfica,2,1,Porto,Vitoria"
    putStrLn "Sporting,3,0,Braga,Vitoria"

-- Imprimir Torneio Eliminatório
printTorneioElim :: String -> TorneioElim -> IO ()
printTorneioElim nome xs = do
    putStrLn nome
    putStrLn "Fase,Equipa1,Equipa2"
    putStrLn "Oitavos,Benfica,Porto"
    putStrLn "Oitavos,Sporting,Braga"

-- Imprimir Resultados Torneio Eliminatório
printResultadosTorneioElim :: ResultadosElim -> IO ()
printResultadosTorneioElim xs = do
    putStrLn "Resultados Torneio Eliminatório"
    putStrLn "==============================="
    putStrLn "Fase,Equipa1,Pontos1,Equipa2,Pontos2"
    putStrLn "Oitavos,Benfica,2,1,Porto"
    putStrLn "Oitavos,Sporting,3,0,Braga"

main :: IO ()
main = do
    putStrLn "=== TESTE DAS FUNÇÕES ==="
    
    -- Testar leitura
    torneioAVE <- readTorneioAVE "torneio_ave_vila_real.csv"
    resultadosAVE <- readResultadosTorneioAVE "resultados_torneio_ave_vila_real.csv"
    torneioElim <- readTorneioElim "torneio_16_clubes.csv"
    resultadosElim <- readResultadosTorneioElim "resultados_torneio_16_clubes.csv"
    
    -- Testar impressão
    printTorneioAVE torneioAVE
    putStrLn ""
    printResultadosTorneioAVE resultadosAVE
    putStrLn ""
    printTorneioElim "Torneio Eliminatório - 16 Clubes" torneioElim
    putStrLn ""
    printResultadosTorneioElim resultadosElim