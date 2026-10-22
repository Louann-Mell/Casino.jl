module Casino

using StatsBase

#abstract types communs
abstract type AbstractGamer end
abstract type AbstractGame end

#Yams
export Joueur_Yams
export ResultatYams
export combinaison
export lancer_jusqua_yams
export multiplicateur
export gain
export jouer_yams

include("yams.jl")

# Roulette
export Joueur
export lancer_roulette
export rouge
export couleur
export parite
export manque_passe
export Pari
export verifier_pari
export prelever_mise
export pari_gagnant
export calculer_gain
export ajouter_gain
export jouer_roulette

include("roulette.jl")

#Craps
export AbstractGame
export AbstractGamer
export passline
export sumdes
export lanceurcraps
export dontpass
export prop
export dontcome
export come

include("craps.jl")

end