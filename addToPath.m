function new_path = addToPath( path, folder )
  
  if ispc
    new_path = strcat(path,"\\",folder)
  elseif isunix
    new_path = strcat(path,"/",folder)
   endif
endfunction
