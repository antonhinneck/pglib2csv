function [filenames] = listDotMFiles( this_dir )
  
  filenames = cellstr([]);
  counter = 1;
  
  for i = 1:length(this_dir)
    if length(this_dir(i).name) > 2
      if isDotM(this_dir(i).name)
        disp(true)
        filenames(counter, 1) = this_dir(i).name;
        counter += 1;
      end
    end
  end
endfunction 