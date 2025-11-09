module Fileread where

-- Guardamos o texto de cada ficheiro linha a linha.
type TorneioAVE = [String]
type ResultadosAVE = [String]
type TorneioElim = [String]
type ResultadosElim = [String]

-- Ler o torneio AVE e devolver todas as linhas verdadeiras do CSV.
readTorneioAVE :: String -> IO TorneioAVE
readTorneioAVE nomeFicheiro = do
  conteudo <- readFile nomeFicheiro
  putStrLn "Conteúdo do ficheiro Torneio AVE:"
  putStrLn conteudo
  return (lines conteudo)

-- Ler os resultados do torneio AVE.
readResultadosTorneioAVE :: String -> IO ResultadosAVE
readResultadosTorneioAVE nomeFicheiro = do
  conteudo <- readFile nomeFicheiro
  putStrLn "Conteúdo do ficheiro Resultados AVE:"
  putStrLn conteudo
  return (lines conteudo)

-- Ler o torneio eliminatório.
readTorneioElim :: String -> IO TorneioElim
readTorneioElim nomeFicheiro = do
  conteudo <- readFile nomeFicheiro
  putStrLn "Conteúdo do ficheiro Torneio Eliminatório:"
  putStrLn conteudo
  return (lines conteudo)

-- Ler os resultados do torneio eliminatório.
readResultadosTorneioElim :: String -> IO ResultadosElim
readResultadosTorneioElim nomeFicheiro = do
  conteudo <- readFile nomeFicheiro
  putStrLn "Conteúdo do ficheiro Resultados Eliminatório:"
  putStrLn conteudo
  return (lines conteudo)

-- Imprimir o torneio AVE tal como está no ficheiro.
printTorneioAVE :: TorneioAVE -> IO ()
printTorneioAVE linhas = do
  putStrLn "Torneio AVE - Vila Real"
  putStrLn "======================="
  mapM_ putStrLn linhas

-- Imprimir os resultados do torneio AVE.
printResultadosTorneioAVE :: ResultadosAVE -> IO ()
printResultadosTorneioAVE linhas = do
  putStrLn "Resultados Torneio AVE - Vila Real"
  putStrLn "=================================="
  mapM_ putStrLn linhas

-- Imprimir o torneio eliminatório.
printTorneioElim :: String -> TorneioElim -> IO ()
printTorneioElim titulo linhas = do
  putStrLn titulo
  putStrLn "================================"
  mapM_ putStrLn linhas

-- Imprimir os resultados do torneio eliminatório.
printResultadosTorneioElim :: ResultadosElim -> IO ()
printResultadosTorneioElim linhas = do
  putStrLn "Resultados Torneio Eliminatório"
  putStrLn "==============================="
  mapM_ putStrLn linhas