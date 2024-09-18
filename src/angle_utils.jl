
import Unitful: rad, °, sr, Quantity, NoDims


bound_ϕ(ϕ) = mod2pi(ϕ+pi) - pi
function bound_ϕ( ϕ::Quantity{T, NoDims, typeof(°)} ) where T
    mod(ϕ + 180°, 360°) - 180°
end

bound_θ(θ) = (θ==pi/2) ? θ : mod(θ + pi/2, pi) - pi/2
function bound_θ( θ::Quantity{T, NoDims, typeof(°)} ) where T
    if θ == 90°; return θ
    else
        return mod(θ + 90°, 180°) - 90°
    end
end


# for checking if a value is inside a window defined on a circle. 
function in_circ_window(l, l0, dl, lmin, lmax)

    l_left = bound_ϕ( l0 - dl )  
    l_right = bound_ϕ( l0 + dl )
    
    in_right_win = (l0 < l_right) ? (l0 <= l <= l_right) : ( (l0 <= l <= lmax) | (lmin <= l <= l_right) )
    in_left_win  = (l_left < l0)  ? (l_left <= l <= l0)  : ( (l_left <= l <= lmax) | (lmin <= l <= l0) )
    
    return in_left_win | in_right_win
end

in_ϕ_window(l, l0, dl) = in_circ_window(l, l0, dl, -pi, pi)
in_θ_window(b, b0, db) = in_circ_window(b, b0, db, -pi/2, pi/2)
