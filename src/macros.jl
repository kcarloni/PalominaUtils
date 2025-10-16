
macro println(x)
    return quote
        println( $(esc(x)) )
        # println( repr( MIME("text/plain"), $(esc(x)) ) )
    end
end

macro display(x)
    return quote
        display( $(esc(x)) )
    end
end

macro dump(x)
    return quote
        dump( $(esc(x)) )
    end
end

macro flatten(x)
    return quote
        flatten( $(esc(x)) )
    end
end

macro convert( t, x )
    return quote
        convert( $(esc(t)), $(esc(x)) )
    end
end

macro propertynames(x)
    return quote
        propertynames( $(esc(x)) )
    end
end


# macro name(arg)
#     x = string(arg)
#     quote
#         $x
#     end
# end

# macro show_left(exs...)
#     blk = Expr(:block)
#     for ex in exs
#         push!(blk.args, :(
#             println($(sprint(Base.show_unquoted,ex.args[1])*" = "),
#                 repr(MIME("text/plain"), begin local value = $(esc(ex)) end))
#             )
#         )
#     end
#     isempty(exs) || push!(blk.args, :value)
#     return blk
# end