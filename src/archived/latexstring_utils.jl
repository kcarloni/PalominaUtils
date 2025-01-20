
# improved LaTeXString multiplication 


# using LaTeXStrings: LaTeXString
# import Base.*
# *(L1::LaTeXString, L2::LaTeXString) = LaTeXString( L1[1:end-1] * L2[2:end] )
# *(L::LaTeXString, S::String ) = LaTeXString( String(L) * "\textrm{" * S * "}" )
# *(S::String, L::LaTeXString ) = LaTeXString( S * String(L) )


# using LaTeXStrings: LaTeXString
# import Base.*
# *(S::Union{AbstractChar, String}, L::LaTeXString ) = latexstring( S * String(L) )
# *(L::LaTeXString, S::Union{AbstractChar, String} ) = latexstring( String(L) * S )
# *( 
#     a::Union{String, AbstractChar, LaTeXString}, 
#     b::Union{String, AbstractChar, LaTeXString}, 
#     c::Union{String, AbstractChar, LaTeXString}, 
# ) = ( a * b ) * c 

# *(L::LaTeXString, S::String ) = ( String(L) * "\textrm{" * S * "}" )
# *(L::LaTeXString, S::String ) = ( String(L) * "\textrm{" * S * "}" )

