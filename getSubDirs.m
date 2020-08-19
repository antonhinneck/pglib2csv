function [subdirs] = getSubDirs( this_dir )
  
  subdirs = cellstr([]);
  counter = 1;
  
  for i = 1:length(this_dir)
    if length(this_dir(i).name) > 2
      if this_dir(i).isdir
        subdirs(counter, 1) = this_dir(i).name;
        counter += 1;
      end
    end
  end
endfunction 