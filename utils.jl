
# miscellaneous utility functions.

get_diffs( x ) = (x[2:end] .- x[1:end-1])
get_centers(edg) = 0.5 .* (edg[1:end-1] .+ edg[2:end])

deg_to_rad(x) = x * pi/180
rad_to_deg(x) = x * 180/pi


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


# for accept-reject sampling:
function accept_reject_sample(f, max_f, max_x::Real)

    x = 0.
    reject = true
    while reject
        x = rand() * max_x
        y = rand() * max_f
        if ( y <= f(x) );  reject=false; end
    end
    return x
end

function accept_reject_sample(f, max_f, max_x::AbstractVector)

    ndims = length(max_x)
    x = Vector{Float64}(undef, ndims)

    reject = true
    while reject
        x .= rand( ndims ) .* max_x
        y = rand() * max_f
        if ( y <= f(x...) );  reject=false; end
    end
    return x
end
