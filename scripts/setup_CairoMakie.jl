
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

# these are relative to 1 CSS px
const inch = 96
const pt = 4/3

