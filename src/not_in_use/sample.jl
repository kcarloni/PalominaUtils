
function accept_reject_sample(f, max_f, extrema_x )
    min_x, max_x = extrema_x
    x = 0.
    reject = true
    while reject
        x = min_x + rand() * (max_x - min_x) 
        y = rand() * max_f
        if ( y <= f(x) );  reject=false; end
    end
    return x
end

# # for accept-reject sampling:
# function accept_reject_sample(f, max_f, max_x::Real)

#     x = 0.
#     reject = true
#     while reject
#         x = rand() * max_x
#         y = rand() * max_f
#         if ( y <= f(x) );  reject=false; end
#     end
#     return x
# end

# function accept_reject_sample(f, max_f, max_x::AbstractVector)

#     ndims = length(max_x)
#     x = Vector{Float64}(undef, ndims)

#     reject = true
#     while reject
#         x .= rand( ndims ) .* max_x
#         y = rand() * max_f
#         if ( y <= f(x...) );  reject=false; end
#     end
#     return x
# end