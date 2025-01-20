
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