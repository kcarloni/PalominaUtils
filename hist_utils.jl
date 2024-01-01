
using StatsBase

# rectangle(w, h, x, y) = Shape(x .+ [0,w,w,0], y .+ [0,0,h,h])
# rectangle( x1, x2, y1, y2 ) = Shape( [x1, x2, x2, x1], [y1, y1, y2, y2] )

Base.step(x::T) where T <: AbstractVector = x[2:end] .- x[1:end-1]

function calc_hist_w_errs( x, weights, edges, normalize=true )
    
    h = fit( Histogram, 
        x, 
        Weights(weights),
        edges
    )
    h_err = fit( Histogram, 
        x, 
        Weights( weights .^2 ),
        edges
    )

    Δx = step(edges)

    if normalize;       w_norm = sum( h.weights ) .* Δx
    else;               w_norm = 1.
    end

    x_weights = h.weights ./ w_norm
    x_errs = sqrt.( h_err.weights ) ./ w_norm
    return x_weights, x_errs
end


function plot_hist_err!( x_edges, y_vals, y_errs; kwargs... )
    for i in eachindex( y_vals )
        
        ## rectangle plots...
        # plot!( rectangle( x_edges[i], x_edges[i+1], y_vals[i]-y_errs[i]/2, y_vals[i]+y_errs[i]/2  ); kwargs... )
                
        kwargs_no_label = [ k for k in kwargs if k[1] != :label ]

        # horizontal line
        plot!( x_edges[i:i+1], [y_vals[i], y_vals[i]]; kwargs_no_label... )        
        
        # vertical line
        x_center = 0.5*sum(x_edges[i:i+1])
        plot!( [x_center, x_center], [y_vals[i]-y_errs[i]/2, y_vals[i]+y_errs[i]/2]; kwargs_no_label...  )
    end

    scatter!([], []; marker=:plus, kwargs...)

end

function plot_1dim_samples!( samples, y0=0., y1=1.; kwargs... )
    for x in samples
        plot!( [x, x], [y0, y1]; kwargs... )
    end
end

"""
'column normalized' when plotted using 
    `plot( get_centers.(h.edges)..., h.weights' )`

( row index increases along x-axis -> becomes column index )
"""
function calc_colnorm_hist2d( x, weights, edges )
    h = fit( Histogram, x, Weights(weights), edges )
    for row in eachrow(h.weights)
        row ./= sum(row)
    end
    # h.weights[ h.weights .== 0. ] .= NaN
    return h
end

function calc_col_quantile( colnorm_h, q )

    # 'colnorm' = when plotted 
    # ( row index increases along x-axis -> becomes column index )
    # sum.( eachrow(h) ) = 1, 1, ...

    y_vals = get_centers( colnorm_h.edges[2] )
    yq_of_x = Vector{Float64}(undef, length(colnorm_h.edges[1])-1 )

    for (i, row) in enumerate( eachrow( colnorm_h.weights ) )
        yq_of_x[i] = quantile( y_vals, Weights( row ), q )
    end

    return yq_of_x
end
