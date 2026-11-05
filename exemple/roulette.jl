using Casino

# tester la roulette 
roulette = RouletteGame()
joueur = RouletteGamer(100.0)

pari1 = Pari(17, NumeroBet, 10.0)
resultat1 = bet!(roulette, joueur, pari)

pari2 = Pari(0, RougeBet, 20.0)
resultat2 = bet!(roulette, joueur, pari2)