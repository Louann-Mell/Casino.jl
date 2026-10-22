using Casino


roulette = RouletteGame()
rand(roulette)
joueur= RouletteGamer(200.0)


bet!(roulette, joueur,Pari( "pair", 70.0))

numero =rand(roulette)
numero, couleur(numero), parite(numero),manque_passe(numero)




pari1 = Pari("imPAir", 10.0)
verifier_pari(pari1, joueur)

prelever_mise(joueur, pari)
joueur

println(pari_gagnant(Pari("rouge", 10.0),lancer_roulette()))

pari2 = Pari("Impair", 10.0)

numero = 3

println(calculer_gain(pari2, numero))


gain = calculer_gain(pari, numero)


# tester la roulette 
joueur = RouletteGamer(100.0)
pari = Pari("ROUGE", 10.0)
jouer_roulette(joueur, pari)