
import PyCall: PyObject, @py_str
Base.dump( o::PyObject ) = collect( s for s in py"dir($o)" if ! startswith(s, '_') )
