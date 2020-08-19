function result = isDotM( filename )
  
  result = false
  len = length(filename)
  if len > 1
    if filename((len-1):len) == ".m"
      result = true
    endif
  endif
endfunction
