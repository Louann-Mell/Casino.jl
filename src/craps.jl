mutable struct CrapsGamer <: AbstractGamer
    capital :: Int
    mise :: Int
end

struct CrapsGame <:AbstractGame end

Base.rand((lanceur::CrapsGame))

function sumdes()
v=rand(1:6, 2)
v=v[1]+v[2]
end



function lanceurcraps()
b=sumdes()
end

#a prends le 1er lancer de des
#b prends tous les lancers sur le point
#pari le plus general du craps (facile de gagner)
function passline(a::Int,CrapsGamer:: AbstractGamer) 
if(a==7) || (a==11)
    print("gagné") 
    CrapsGamer.capital=CrapsGamer.capital + CrapsGamer.mise #puisqu'on a pas enlevé la mise avant
elseif (a==2)|| (a==3)||(a==12)
    print("perdu")  
    CrapsGamer.capital= CrapsGamer.capital - CrapsGamer.mise
else
    #jeu sur le point
    print("point = ", a)

    b=lanceurcraps()
    while (b!=7) & (b!=a)
       b=sumdes()
        if(b==a)
        print("gagné ")   #joueur reprends sa mise donc pas de changement de capital 
        elseif (b==7)
        print(", 7 qui prend ") 
        CrapsGamer.capital=CrapsGamer.capital-CrapsGamer.mise
        else 
        print("relance: ")
        end
    print("des tirés: ",b, ' ')
    end
end
return CrapsGamer
end

#même fonctionnement que passLine en inversé
function dontpass(a::Int,CrapsGamer:: AbstractGamer)  #pari don't pass
if(a==7) || (a==11)
    print("perdu ")  #perds la mise
    CrapsGamer.capital=CrapsGamer.capital-CrapsGamer.mise
elseif (a==2)|| (a==3)
    print("gagné ")   #gagne ce que tu as mise
    CrapsGamer.capital=CrapsGamer.capital + CrapsGamer.mise
elseif(a==12)
    print("reprends ta mise ")
else
   print("point = ", a)

    b=lanceurcraps()
    while (b!=7) & (b!=a)
       b=sumdes()
        if(b==a)
        print("perdu au point ")  #perds la mise
        CrapsGamer.capital=CrapsGamer.capital-CrapsGamer.mise
        elseif (b==7)
        print(", 7 qui prend ")   #gagne la mise 
        CrapsGamer.capital=CrapsGamer.capital+CrapsGamer.mise
        else 
        print("relance: ")
        end
    print("des tirés: ",b, ' ')
    end 
end
return CrapsGamer
end

#pari proposition (chiffre precis) sur un lancer
function prop(x,CrapsGamer:: AbstractGamer)  
s=readline()  
print("lancer= ",x)
if(x==s)
  print("gagné")   #gagne ta mise 
  CrapsGamer.capital=CrapsGamer.capital+CrapsGamer.mise
else
    print("perdu")
    CrapsGamer.capital=CrapsGamer.capital-CrapsGamer.mise
end
return CrapsGamer
end

#comme passline mais a placer n'importe quand
function come(a::Int,CrapsGamer:: AbstractGamer)  
if(a==7) || (a==11)
    print("gagné ")   #prends gros gain (pari risqué)
elseif (a==2)|| (a==3)||(a==12)
    print("perdu ")
else
    #jeu sur le point
    print("point = ", a)

    b=lanceurcraps()
    while (b!=7) & (b!=a)
       b=sumdes()
        if(b==a)
        print("gagné au point ")  #reprends ta mise
        CrapsGamer.capital=CrapsGamer.capital+CrapsGamer.mise
        elseif (b==7)
        print(", 7 qui prend ")  #perdu
        CrapsGamer.capital=CrapsGamer.capital-CrapsGamer.mise
        else 
        print("relance: ")
        end
    print("des tirés: ",b, ' ')
    end
end
return CrapsGamer
end

#comme dontpass mais a placer n'import quand
function dontcome(a::Int,CrapsGamer:: AbstractGamer)
if(a==7) || (a==11)
    print("perdu ")
    CrapsGamer.capital=CrapsGamer.capital-CrapsGamer.mise
elseif (a==2)|| (a==3)
    print("gagné ")  #gagne ta mise
    CrapsGamer.capital=CrapsGamer.capital+CrapsGamer.mise
elseif(a==12)
    print("reprends ta mise ")
else
   print("point = ", a)

    b=lanceurcraps()
    while (b!=7) & (b!=a)
       b=sumdes()
        if(b==a)
        print("perdu au point ")  
        CrapsGamer.capital=CrapsGamer.capital-CrapsGamer.mise
        elseif (b==7)
        print(", 7 qui prend ")  #gagne ta mise
        CrapsGamer.capital=CrapsGamer.capital+CrapsGamer.mise
        else 
        print("relance: ")
        end
    print("des tirés: ",b, ' ')
    end 
end
return CrapsGamer
end