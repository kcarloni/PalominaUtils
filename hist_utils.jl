

# rectangle(w, h, x, y) = Shape(x .+ [0,w,w,0], y .+ [0,0,h,h])
# rectangle( x1, x2, y1, y2 ) = Shape( [x1, x2, x2, x1], [y1, y1, y2, y2] )

function calc_hist_w_errs( x, weights, edges )
    
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

    Δx = edges[2:end] .- edges[1:end-1]
    w_norm = sum( h.weights ) .* Δx
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
<<<<<<< HEAD
        plot!( x_edges[i:i+1], [y_vals[i], y_vals[i]]; [ k for k in kwargs if k[1] != :label ]... )
        
        # vertical line
        x_center = 0.5*sum(x_edges[i:i+1])
        plot!( [x_center, x_center], [y_vals[i]-y_errs[i]/2, y_vals[i]+y_errs[i]/2]; 
            [ k for k in kwargs if k[1] != :label ]...)
=======
        plot!( x_edges[i:i+1], [y_vals[i], y_vals[i]]; kwargs_no_label... )        
        
        # vertical line
        x_center = 0.5*sum(x_edges[i:i+1])
        plot!( [x_center, x_center], [y_vals[i]-y_errs[i]/2, y_vals[i]+y_errs[i]/2]; kwargs_no_label...  )
>>>>>>> 1ce567e66e95178128b50340a230a79b70512c47
    end

    scatter!([], []; marker=:plus, kwargs...)

end

"""
    'column normalized' when plotted using 
        plot( get_centers.(h.edges)..., h.weights' )

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
