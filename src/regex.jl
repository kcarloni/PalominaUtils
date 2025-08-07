
# nicer regex indexing
function Base.getproperty( x::RegexMatch{T}, sym::Symbol ) where T
    if sym in fieldnames( typeof(x) )
        return getfield( x, sym )
    elseif string(sym) in keys( x )
        return x[string(sym)]
    end
end