
using ColorSchemes

function get_cscheme_centered_at(x0, x; cscheme=ColorSchemes.tol_prgn, N=10)
    xmin, xmax = extrema(x)
    α = max(x0 - xmin, xmax - x0)
    ColorScheme([ get(cscheme, (y - (1-α))/(2α) ) for y in range(xmin, xmax, N) ])
end