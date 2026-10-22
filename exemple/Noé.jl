using Casino
using Plots

Noé = Joueur_Yams("Noé", 1000.0, 0)

# Simulation de 100 parties
historique = simule_Yams(Noé, 100, 10.0)

# Graphique de l'évolution du solde sur 100 parties
plot(
    0:(length(historique)-1),
    historique,
    xlabel = "Nombre de parties",
    ylabel = "Solde",
    title = "Évolution du solde au Yams",
    label = "Solde du joueur",
    linewidth = 2
)