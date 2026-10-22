struct RouletteGame <: AbstractGame
end

mutable struct RouletteGamer <: AbstractGamer
    capital::Float64
end

struct Pari
    type_pari::String
    mise::Float64
end

function bet!(roulette::RouletteGame, joueur::RouletteGamer, pari::Pari)
    pari_gagnant(pari, rand(roulette))
    prelever_mise(joueur, pari)
    joueur
end

 Base.rand((roulette::RouletteGame)) = rand(0:36)

rouge = [1,3,5,7,9,12,14,16,18,19,21,23,25,27,30,32,34,36]

function couleur(numero)
    if numero == 0
        return "vert"
    elseif numero in rouge
        return "rouge"
    else
        return "noir"
    end
end

function parite(numero)
    if numero == 0
        return :aucune
    elseif iseven(numero)
        return :pair
     else
        return :impair
    end
end

function manque_passe(numero)
    if numero == 0
        return "aucune"
    elseif numero in 1:18
        return "manque"
    else
        return "passe"
    end
end


function verifier_pari(pari::Pari, joueur::RouletteGamer)

    types_valides = ["rouge","noir", "pair", "impair", "manque", "passe"] # gere le problemes des majuscules et minuscules
    type = lowercase(pari.type_pari)
    if !(type in types_valides)
        error("Type de pari invalide. Les types valides sont : $(types_valides).")
    elseif pari.mise <= 0
        error("La mise doit être un montant positif.")
    elseif pari.mise > joueur.capital
        println("Vous n'avez pas assez de capital pour ce pari.")
        return false
    else
        println("Pari valide : $(pari.type_pari) avec une mise de $(pari.mise)€.")
        return true
    end
    
end

function prelever_mise(joueur::RouletteGamer, pari::Pari)
    if verifier_pari(pari, joueur)
        joueur.capital = joueur.capital - pari.mise
        println("Mise de $(pari.mise)€ prélevée. Capital restant : $(joueur.capital)€.")
    else
        
        joueur.capital = 0
        println("Tu as tout perdu!")
    end
end

function pari_gagnant(pari::Pari, numero::Int)
    type=lowercase(pari.type_pari)

    if type == "rouge" && lowercase(couleur(numero)) == "rouge"
        return true
    elseif type == "noir" && lowercase(couleur(numero)) == "noir"
        return true
    elseif type == "pair" && parite(numero) == :pair
        return true
    elseif type == "impair" && parite(numero) == :impair
        return true
    elseif type == "manque" && lowercase(manque_passe(numero)) == "manque"
        return true
    elseif type == "passe" && lowercase(manque_passe(numero)) == "passe"
        return true
    else
        return false
    end
end

function calculer_gain(pari::Pari, numero::Int)
    if pari_gagnant(pari, numero)
        return pari.mise * 2
    else
        return 0.0
    end
    
end

function ajouter_gain(joueur::RouletteGamer, gain::Float64)
    joueur.capital = joueur.capital + gain
    return  joueur.capital
    println("Gain de $(gain)€ ajouté. Nouveau capital : $(joueur.capital)€.")
end

function jouer_roulette(joueur::RouletteGamer, pari::Pari)

    # prelever la mise
    prelever_mise(joueur, pari)
    
    # lancer la roulette
    numero = lancer_roulette()

    # calculer le gain
    gain = calculer_gain(pari, numero)

    # ajouter le gain au capital du joueur
    ajouter_gain(joueur, gain)

    # afficher le résultat du tour
    println("Numéro tiré : $(numero).")
    println("couleur : $(couleur(numero))")
    println("Parité : $(parite(numero))")
    println("Manque/Passe : $(manque_passe(numero))")


    if gain > 0
        println("Félicitations ! Vous avez gagné $(gain)€.")
    else
        println("Désolé, vous avez perdu votre mise de $(pari.mise)€.")
    end

    println("Capital restant : $(joueur.capital)€.")

end