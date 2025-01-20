
using StructArrays
using TypedTables

Base.NamedTuple( s::Union{StructArray, StructVector} ) = Base.NamedTuple( [ (sym, getproperty(s,sym)) for sym in propertynames(s) ] )
TypedTables.Table( s::StructArray ) = Table( NamedTuple(s) )

function Base.show(io::IO, ::MIME"text/plain", s::StructArray{T}) where T

    # print(io, "StructArray")
    # StructArrays.showfields(io, Tuple(StructArrays.components(s)))
    # true && print(io, " with eltype ", T)

    print(io, "StructArray(")
    type_repr = repr( MIME("text/plain"), NamedTuple(s)[1] )
    i0 = findfirst('{', type_repr )
    print(io, type_repr[1:i0-1] )
    print(io, ") ")
    print(io, "with eltype ", repr(T))

    # print(io, "with eltype ", MilkyWayGalaxy.simple_repr(T))

    table_repr = repr( MIME("text/plain"), Table(s) )
    i0 = findfirst('\n', table_repr )
    print(io, table_repr[i0:end] )
end