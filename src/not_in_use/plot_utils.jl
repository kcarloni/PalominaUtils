
function get_cscheme_centered_at(x0, xmin, xmax; cscheme=ColorSchemes.tol_prgn, N=256)
    x = range(xmin, xmax, N)
    # right shift:
    if (xmax - x0) > (x0 - xmin)
        return ColorScheme( get.( Ref(cscheme), (@. 1 - 0.5 * (xmax - x)/(xmax - x0)) ) )
    else
        return ColorScheme( get.( Ref(cscheme), (@.     0.5 * (x - xmin)/(x0 - xmin)) ) )
    end
end

function calc_zcolor( x, xmin, xmax, cmin=0., cmax=1.)
    if x <= xmin;       return cmin
    elseif x >= xmax;   return cmax
    else
        return cmin + cmax * (x - xmin)/xmax
    end
end

function plot_stair!( x_edges, y; kwargs... )
    plot!( x_edges, [y..., y[end]]; seriestype=:steppost, kwargs... )
end


