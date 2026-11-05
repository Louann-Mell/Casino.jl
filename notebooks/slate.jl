try; import KaimonSlate; catch; error("This is a Kaimon Slate notebook — running it as plain Julia needs the KaimonSlate runtime in this environment. Add it with `import Pkg; Pkg.add(\"KaimonSlate\")`, or open it in Kaimon Slate."); end; KaimonSlate.standalone!(@__MODULE__; dir=@__DIR__)

#%% md id=intro
@md"""
# Mon notebook
"""

#%% code id=f3c9e0
import Pkg; Pkg.activate(".")

#%% code id=5dc8fa
import Pkg; Pkg.activate(".")

#%% code id=6dedab
using Casino

#%% code id=e36327
using WGLMakie

#%% code id=5bb643
WGLMakie.activate!()

fig = Figure(size = (800, 450))

ax = Axis(
    fig[1, 1],
    xlabel = "Nombre de parties",
    ylabel = "Solde (€)",
    title = "Évolution du solde au Yams"
)

historique = [1000.0, 990.0, 1010.0, 1000.0, 980.0, 1020.0]

lines!(ax, 0:(length(historique)-1), historique)

display(fig)

#%% code id=639290
using Casino
using WGLMakie

Noé = YamsGamer("Noé", 1000.0, 0)

historique = base.rand(Noé, 100, 10.0)

fig = Figure(size = (800, 450))
ax = Axis(fig[1, 1],
    xlabel = "Nombre de parties",
    ylabel = "Solde (€)",
    title = "Simulation de 100 parties de Yams"
)

lines!(ax, 0:(length(historique)-1), historique,
    linewidth = 2,
    label = "Solde du joueur"
)

hlines!(ax, [historique[1]],
    color = :red,
    linestyle = :dash,
    label = "Solde initial"
)

axislegend(ax)

display(fig)

# ╔═╡ Slate.config · per-notebook settings (Settings panel)
#   docid = 349d6240-7636-4e8e-bb5f-f2e82b54fc8a
# ╚═╡
