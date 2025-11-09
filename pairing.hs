module Pairing where
import Fileread

-- acrescenta linhas "Por Jogar" para todas as mesas do AVE
runAVEparing :: TorneioAVE -> ResultadosAVE -> ResultadosAVE
runAVEparing jogos resultados = resultados ++ novas
  where
    novas = [(a, 0, 0, b, "Por Jogar") | (a, _, _, b) <- jogos]

-- gera o quadro completo: oitavos, quartos, meias e final
runElimParing :: TorneioElim -> ResultadosElim -> ResultadosElim
runElimParing jogos resultados = resultados ++ oitavos ++ quartos ++ meias ++ finais
  where
    paresOitavos = take 8 [(a, b) | (_, a, b) <- jogos]
    oitavos = zipWith (mkLinha "Oitavos") paresOitavos [1 ..]
    numOitavos = length oitavos

    vencedoresOitavos = map vencedor [1 .. numOitavos]
    paresQuartos = pair2 vencedoresOitavos
    numQuartos = length paresQuartos
    indicesQuartos = [numOitavos + 1 .. numOitavos + numQuartos]
    quartos = zipWith (mkLinha "Quartos") paresQuartos indicesQuartos

    vencedoresQuartos = map vencedor indicesQuartos
    paresMeias = pair2 vencedoresQuartos
    numMeias = length paresMeias
    inicioMeias = numOitavos + numQuartos + 1
    indicesMeias = [inicioMeias .. inicioMeias + numMeias - 1]
    meias = zipWith (mkLinha "Meias") paresMeias indicesMeias

    vencedoresMeias = map vencedor indicesMeias
    paresFinais = pair2 vencedoresMeias
    inicioFinais = inicioMeias + numMeias
    indicesFinais = [inicioFinais .. inicioFinais + length paresFinais - 1]
    finais = zipWith (mkLinha "Final") paresFinais indicesFinais

pair2 :: [a] -> [(a, a)]
pair2 (x:y:resto) = (x, y) : pair2 resto
pair2 _ = []

vencedor :: Int -> String
vencedor n = "Vencedor J" ++ show n

mkLinha :: String -> (String, String) -> Int -> (String, Int, Int, String)
mkLinha fase (a, b) numero = (fase, 0, 0, "J" ++ show numero ++ ": " ++ a ++ " vs " ++ b)