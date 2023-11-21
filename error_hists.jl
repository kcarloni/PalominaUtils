

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
                
        # horizontal line
        plot!( x_edges[i:i+1], [y_vals[i], y_vals[i]]; kwargs... )
        
        # vertical line
        x_center = 0.5*sum(x_edges[i:i+1])
        plot!( [x_center, x_center], [y_vals[i]-y_errs[i]/2, y_vals[i]+y_errs[i]/2]; kwargs...  )
    end
    plot!()
end