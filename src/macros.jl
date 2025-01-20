
macro println(x)
    return quote
        println( repr( MIME("text/plain"), $(esc(x)) ) )
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