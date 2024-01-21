
# -------------

# functionality for plotting 'pixelated' contours...
function get_vertices_of_sq(x, y, square_ij)
    i, j = square_ij
    [ 
        (x[i],   y[j]), 
        (x[i],   y[j+1]), 
        (x[i+1], y[j+1]), 
        (x[i+1], y[j]) 
    ]
end

function get_edges_of_sq(x, y, square_ij)
    vcs = get_vertices_of_sq(x, y, square_ij)
    edges = []
    prev_vc = vcs[end]
    for vc in vcs
        push!(edges, ( [ prev_vc[1], vc[1]], [prev_vc[2], vc[2] ] ))
        prev_vc = vc
    end
    return edges
end

function is_the_same(edg_1, edg_2)
    x_is_same = ( edg_1[1] == edg_2[1] ) | ( edg_1[1] == [ edg_2[1][2], edg_2[1][1] ] )
    y_is_same = ( edg_1[2] == edg_2[2] ) | ( edg_1[2] == [ edg_2[2][2], edg_2[2][1] ] )
    return x_is_same && y_is_same
end

function get_contour_edges( x, y, squares )

    edges = get_edges_of_sq(x, y, squares[1])
    for sq in squares[2:end]
        for edg in get_edges_of_sq(x, y, sq)

            repeated = []
            for j in eachindex(edges)
                if is_the_same(edg, edges[j])
                    push!(repeated, j)
                end
            end
            (length(repeated) == 0) && ( push!(edges, edg) )
            deleteat!(edges, repeated)
        end
    end
    return edges
end

function plot_sq_contour!(edges; kwargs...)

    plot!(edges[1]...; kwargs...)
    kwargs = [p for p in pairs(kwargs) if p[1] != :label]
    for edge in edges[2:end]
        plot!(edge...; kwargs...)
    end
end


# ------------
# functionalities for selecting squares...

function get_squares_containing_q_prob(h, q)

    weights_vec = reshape(h.weights, (length(h.weights)))

    dx, dy = [ x[2]-x[1] for x in h.edges ]

    nx, ny = size(h.weights)

    indices_vec = [ (i,j) for i in 1:nx, j in 1:ny ]
    n_nan = sum( isnan.(weights_vec) )
    ixs = sortperm(weights_vec, rev=true)
    ixs = ixs[(n_nan+1):end]

    ptot = 0
    i = 0
    while ( ptot < q ) && ( i < length(ixs))
        i += 1
        ptot += weights_vec[ixs][i] * dx * dy
    end

    @show sum(weights_vec[ixs][1:i] * dx * dy)
    squares = indices_vec[ixs][1:i]

end

function get_squares_greater_than( xx, minval )

    nx, ny = size(xx)
    # indices = Base.Iterators.product( 1:nx, 1:ny )
    indices_vec = [ (i,j) for i in 1:nx, j in 1:ny ]

    x = reshape( xx, length(xx) )

    # ixs = sortperm( x, rev=true )

    mask_geq = ( x .> minval )
    return indices_vec[mask_geq]
end
