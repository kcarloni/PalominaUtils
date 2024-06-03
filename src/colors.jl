
using ColorSchemes
using Colors
using Measures: mm

gpb_pastel_12 = vcat( 
    ColorSchemes.mint..., 
    # ColorSchemes.candy[5:end]..., 
    # ColorSchemes.pastel[3:end]... 
    ColorSchemes.candy[5:end-1]..., 
    ColorSchemes.pastel[end-1:end]... 
)

rby_4 = parse.( Colorant, ["#5790fc", "#f89c20", "#e42536", "#964a8b" ])

earth_4 = parse.(Colorant, "#".*["5998DA", "945438", "B9C146", "EEAA3B"] )
egypt_4 = parse.(Colorant, ["#109b98", "#ee5305", "#f3a33f", "#8ab1a7"  ])
west_4 = parse.(Colorant, "#" .* ["24cde6","9ab391","8c1f00","d98d00"])
poppy_4 = parse.(Colorant, "#" .* ["bdc89d","57444f","ff2a25","af333e"])

buor_4 = parse.(Colorant, "#" .* ["afc9ff","5e8eff","ff9a4a","ff1300"])
burd_4 = parse.(Colorant, "#" .* ["6392f5","8a0000","fc4c75","531a8a"])

# rd_bu_br4 = parse.(Colorant, [ "#ff8d86", "#b41e15", "#5563bc", "#532026" ])
# beach_4 = parse.(Colorant, "#" .* ["6e9daf","c3c8b9","f9c06c","5d6fb9"])

function plot_palette( colors )

    p = plot(framestyle=:none, ticks=:false, legend=:false, size=(400, 50), margins=0mm)
    for i in eachindex(colors)
        plot!( Shape([(i, 0), (i+1, 0), (i+1, 1), (i, 1)]), fill=true, fc=colors[i], lc=colors[i] )
    end
    return p
end

function plot_palette_as_lines( colors )

    p = plot(framestyle=:semi, ticks=:false, legend=:false, size=(400, 80), margins=0mm)
    for i in eachindex(colors)
        plot!( rand(10), c=colors[i], lw=1.5, marker=:x, msw=12, ms=2 )
    end
    return p
end

other = parse.(Colorant, "#" .* ["3a25a1","f73e2d","9d337c","e6a60e","1f1f66"])
plot_palette_as_lines( poppy_4 )
plot_palette_as_lines( buor_4 )


# other_ = (
#     parse.(Colorant, [ "#b41e15", "#5563bc", "#532026", "#b48f75" ]),
#     parse.(Colorant, ["#109b98", "#ee5305", "#f3a33f", "#8ab1a7"  ]),
#     parse.(Colorant, "#" .* ["4f522d","24cde6","9ab391","d98d00"]),
#     parse.(Colorant, "#" .* ["009286","d0cb71","1e384c","8fb988"])
# )