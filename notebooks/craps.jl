try; import KaimonSlate; catch; error("This is a Kaimon Slate notebook — running it as plain Julia needs the KaimonSlate runtime in this environment. Add it with `import Pkg; Pkg.add(\"KaimonSlate\")`, or open it in Kaimon Slate."); end; KaimonSlate.standalone!(@__MODULE__; dir=@__DIR__)

#%% md id=intro
@md"""
# New Notebook
"""

#%% code id=820887
#import Pkg; Pkg.activate(".")

#%% code id=187732
using Casino

#%% code id=45bbef
using WGLMakie
fig=Figure()
btn1 = Makie.Button(fig[1,1], label="test", tellwidth=false)
fig

# ╔═╡ Slate.config · per-notebook settings (Settings panel)
#   docid = 94ba17ce-80e2-4afd-8610-97f415bfc05f
# ╚═╡
