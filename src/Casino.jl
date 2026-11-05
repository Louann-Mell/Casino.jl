module Casino

using StatsBase

#abstract types communs
abstract type AbstractGamer end
abstract type AbstractGame end

#Yams
export YamsGamer
export ResultatYams
export combinaison
export multiplicateur
export gain
export jouerYams

include("yams.jl")

# Roulette
export RouletteGamer, RouletteGame,  RouletteResult 
export Pari, bet!
export RougeBet, NumeroBet, NoirBet, PairBet, ImpairBet, ManqueBet, PasseBet
export parite, manque_passe, couleur
export verifier_pari, prelever_mise, pari_gagnant
export calculer_gain, ajouter_gain


include("roulette.jl")

#Craps
export CrapsGamer
export ResultatCraps
export passline
export sumdes
export lanceurcraps
export dontpass
export prop
export dontcome
export come
export fig

include("craps.jl")

end