

sunstar_7 = [ parse.( Colorant, ["#FF6BE0ff", "#F61010ff", "#671459ff", colorant"tomato", "#F7B655ff", "#F9B7D5ff", "#FE7A83ff",] )...,  ]

gpb_pastel_12 = vcat( 
    ColorSchemes.mint..., 
    # ColorSchemes.candy[5:end]..., 
    # ColorSchemes.pastel[3:end]... 
    ColorSchemes.candy[5:end-1]..., 
    ColorSchemes.pastel[end-1:end]... 
)

# ---------------

distinct_sequential = Dict()

distinct_sequential[11] = parse.( Colorant, [
    "#5E8EFF",
    "#97B7FF",
    "#DBC37D",
    "#FFA712",
    "#FF3814",
    "#FF538B",
    "#BB42CE",
    "#7818F4",
    "#9182DA",
    "#7DB1CC",
    "#4EE6DB"
])

distinct_sequential[12] = [ 
    distinct_sequential[11][1:10]...,
    parse( Colorant, "#56DBAC"),
    parse( Colorant, "#A5E6A1" )
    #
    # parse( Colorant, "#A5FDCE")
    # parse( Colorant, "#1ECCA0")
]