 @enum BetType NumeroBet RougeBet NoirBet PairBet ImpairBet ManqueBet PasseBet

 @enum NumberResult RougeNumber NoirNumber PairNumber ImpairNumber  ManqueNumber PasseNumber ZeroNumber

 const RougeNumbers = [1,3,5,7,9,12,14,16,18,19,21,23,25,27,30,32,34,36]

struct RouletteGame <: AbstractGame
end


struct Pari
    numero::Int
    type_pari::BetType
    mise::Float64
end


struct RouletteResult
    numero::Int
    pari::Pari
    gain::Float64
end


mutable struct RouletteGamer <: AbstractGamer
    capital::Float64
    results::Vector{RouletteResult}
end

RouletteGamer(capital::Real) = RouletteGamer(Float64(capital), RouletteResult[])



Base.rand((roulette::RouletteGame)) = rand(0:36)


function couleur(numero)
    if numero == 0
        return ZeroNumber
    elseif numero in RougeNumbers
        return RougeNumber
    else
        return NoirNumber
    end
end

function parite(numero)
    if numero == 0
        return ZeroNumber
    elseif iseven(numero)
        return PairNumber
    else
        return ImpairNumber
    end
end

function manque_passe(numero)
    if numero == 0
        return ZeroNumber
    elseif numero in 1:18
        return ManqueNumber
    else
        return PasseNumber
    end
end


function verifier_pari(pari::Pari, joueur::RouletteGamer)

    if !isfinite(joueur.capital) || joueur.capital < 0
        return false
    elseif pari.type_pari == NumeroBet && !(0 <= pari.numero <= 36)
        return false
    elseif !isfinite(pari.mise) || pari.mise <= 0
        return false
    elseif pari.mise > joueur.capital
        return false
    else
        return true
    end
end

function prelever_mise(joueur::RouletteGamer, pari::Pari)
    if !verifier_pari(pari, joueur)
        return false
    else
        joueur.capital -= pari.mise
    return true
    end
end

function pari_gagnant(pari::Pari, numero::Int)
   
    if pari.type_pari == RougeBet &&  couleur(numero) == RougeNumber
        return true
    elseif pari.type_pari == NoirBet &&  couleur(numero) == NoirNumber
        return true
    elseif pari.type_pari == PairBet && parite(numero) == PairNumber
        return true
    elseif pari.type_pari == ImpairBet && parite(numero) == ImpairNumber
        return true
    elseif pari.type_pari == ManqueBet && manque_passe(numero) == ManqueNumber
        return true
    elseif pari.type_pari == PasseBet && manque_passe(numero) == PasseNumber
        return true
    elseif pari.type_pari == NumeroBet && pari.numero == numero
        return true
    else
        return false
    end
end

function calculer_gain(pari::Pari, numero::Int)
    if !pari_gagnant(pari, numero)
        return 0.0
    elseif pari.type_pari == NumeroBet
        return pari.mise * 36
    else
        return pari.mise * 2
    end
end

function ajouter_gain(joueur::RouletteGamer, gain::Float64)
    joueur.capital = joueur.capital + gain
    return  joueur.capital
end

function bet!(roulette::RouletteGame, joueur::RouletteGamer, pari::Pari)

    # vérifier et prelever la mise
    if !prelever_mise(joueur, pari)
        return nothing
    end
    
    # lancer la roulette
    numero = rand(roulette)

    # calculer le gain
    gain = calculer_gain(pari, numero)

    # ajouter le gain au capital du joueur
    ajouter_gain(joueur, gain)

    # Résultat du tour
   resultat= RouletteResult(numero, pari, gain)

    # Ajouter le résultat à l'historique
    push!(joueur.results, resultat)

    # Renvoyer le résultat
    return resultat
end

function Base.show(io::IO, r::RouletteResult)
    print(io, "🎲 Numéro : ", r.numero,
          "\nPari : ", r.pari,
          "\nGain : ", r.gain, " €")
end

function Base.show(io::IO, rg::RouletteGamer)
    print(io, "💰 Capital : ", rg.capital, " €" ,
     "\nNombre de parties : ", length(rg.results))
end

function Base.show(io::IO, p::Pari)
    print(io, "Pari sur le numéro ", p.numero, " de type ", p.type_pari, " avec une mise de ", p.mise, " €")
end