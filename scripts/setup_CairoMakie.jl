
using CairoMakie
using MathTeXEngine: FontFamily, texfont
# FontFamily() = FontFamily("TeXGyreHeros")
FontFamily() = FontFamily("TeXGyrePagella")


update_theme!( 
    fonts=(; 
        regular=texfont(:regular),
        bold=texfont(:bold),
        italic=texfont(:italic),
        bolditalic=texfont(:bolditalic)
    )
)

import CairoMakie.Makie.UnicodeFun: to_superscript
import CairoMakie.Makie: arrows2d!, arrows3d!

# these are relative to 1 CSS px
const inch = 96
const pt = 4/3


function CairoMakie.arrows2d!(ax, 
    x::Real, y::Real, u::Real, v::Real; 
    text=nothing, arrow_kwargs=NamedTuple(), text_kwargs=NamedTuple()
    )

    arrows2d!( ax, [x], [y], [u], [v]; arrow_kwargs... )
    if !isnothing( text )
        lengthscale = hasproperty(arrow_kwargs, :lengthscale) ? arrow_kwargs.lengthscale : 1
        text!( ax, x+u*lengthscale, y+v*lengthscale; text, text_kwargs... )
    end
end

function CairoMakie.arrows3d!(ax, 
    x::Real, y::Real, z::Real, 
    u::Real, v::Real, w::Real; kwargs...) 
    
    arrows3d!( ax, 
        [x], [y], [z], 
        [u], [v], [w]; kwargs... )
end