function result = stripDotM( filename )
  
  result = filename
  len = length(filename)
  if !isDotM( filename )
    error( "The file must have an \".m\" extension." )
  else
    disp(filename)
    result = filename(1:(len-2))
  endif  
endfunction
