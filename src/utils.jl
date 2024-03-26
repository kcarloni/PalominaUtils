
# miscellaneous utility functions.

get_diffs( x ) = (x[2:end] .- x[1:end-1])
get_centers(edg) = 0.5 .* (edg[1:end-1] .+ edg[2:end])

flatten( x::AbstractArray ) = reshape( x, prod(size(x)) )

function try_make_range( x, rtol=1e-5 )

    xr = range( x[1], x[end], length(x) )

    if all( isapprox.( x, xr; rtol ) )
        return xr 
    else
        error("steps not approx. equal")
    end
end

# for checking if a value is inside a window defined on a circle. 
function in_circ_window(l, l0, dl, lmin, lmax)

    l_left = bound_phi( l0 - dl )  
    l_right = bound_phi( l0 + dl )
    
    in_right_win = (l0 < l_right) ? (l0 <= l <= l_right) : ( (l0 <= l <= lmax) | (lmin <= l <= l_right) )
    in_left_win  = (l_left < l0)  ? (l_left <= l <= l0)  : ( (l_left <= l <= lmax) | (lmin <= l <= l0) )
    
    return in_left_win | in_right_win
end

in_lin_window(x, x0, dx) = (x0 - dx) <= x < (x0 + dx)

in_l_window(l, l0, dl) = in_circ_window(l, l0, dl, -pi, pi)
in_b_window(b, b0, db) = in_circ_window(b, b0, db, -pi/2, pi/2)


hav(x) = sin(x/2)^2
archav(x) = 2 * asin( sqrt(x) )

function great_circle_dist( ϕ1, θ1, ϕ2, θ2 )

    ## spherical law of cosines 
    # dot_prod = cos(θ1) * cos(θ2) + sin(θ1) * sin(θ2) * cos(ϕ1 - ϕ2)
    # return acos(dot_prod)

    ## haversine formula
    # delta_θ = abs(θ1 - θ2)
    # delta_ϕ = abs(ϕ1 - ϕ2)
    # x = ( sin(delta_θ/2)^2 + cos(θ1) * cos(θ2) * sin(delta_ϕ/2)^2 )
    # return 2 * asin(sqrt(x))

    ## haversine formula -- numerically better conditioned for small angles
    delta_θ = θ1 - θ2
    delta_ϕ = ϕ1 - ϕ2
    return archav( hav(delta_θ) + ( 1 - hav(delta_θ) - hav(θ1+θ2) ) * hav( delta_ϕ )  )
end