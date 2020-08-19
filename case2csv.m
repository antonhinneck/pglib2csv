function case2csv( func_name, csv_dir )
  
  # bus
  #---------------------------------
  bus_headings = cellstr(["bus_i";	
                          "type";	
                          "Pd";	
                          "Qd";	
                          "Gs";	
                          "Bs";	
                          "area";	
                          "Vm";	
                          "Va";	
                          "baseKV";	
                          "zone";	
                          "Vmax";	
                          "Vmin"])';
                             
  bus_body = num2cell(str2func(func_name)().branch);
  bus = [bus_headings; bus_body];
  
  # gen
  #---------------------------------
  gen_headings = cellstr(["bus";	
                          "Pg";	
                          "Qg";	
                          "Qmax";	
                          "Qmin";	
                          "Vg";	
                          "mBase";	
                          "status";	
                          "Pmax";	
                          "Pmin"])';
                          
  gen_headings_extended = cellstr(["bus";	
                                   "Pg";	
                                   "Qg";	
                                   "Qmax";	
                                   "Qmin";	
                                   "Vg";	
                                   "mBase";	
                                   "status";	
                                   "Pmax";	
                                   "Pmin";	
                                   "Pc1";	
                                   "Pc2";	
                                   "Qc1min";	
                                   "Qc1max";	
                                   "Qc2min";	
                                   "Qc2max";	
                                   "ramp_agc";	
                                   "ramp_10";	
                                   "ramp_30";	
                                   "ramp_q";	
                                   "apf"])';
                           
  gen_body = num2cell(str2func(func_name)().gen);
  if size(gen_body)(2) == 10
    gen = [gen_headings; gen_body];
  elseif size(gen_body)(2) == 21
    gen = [gen_headings_extended; gen_body];
  endif
 
  # gencost
  #---------------------------------
  gencost_headings = cellstr(["2";	
                              "startup";	
                              "shutdown";	
                              "n";	
                              "c2";	
                              "c1";	
                              "c0"])';
                             
  gencost_body = num2cell(str2func(func_name)().gencost);
  gencost = [gencost_headings; gencost_body];

  # branch
  #---------------------------------
  branch_headings = cellstr(["fbus";	
                             "tbus";	
                             "r";	
                             "x";	
                             "b";	
                             "rateA";	
                             "rateB";	
                             "rateC";	
                             "ratio";	
                             "angle";	
                             "status";	
                             "angmin";	
                             "angmax"])';
                             
  branch_body = num2cell(str2func(func_name)().branch);
  branch = [branch_headings; branch_body];
  
  data_dir = addToPath(csv_dir, func_name);
  mkdir( data_dir );
  
  cell2csv( addToPath( data_dir, "bus.csv"), bus )
  cell2csv( addToPath( data_dir, "gen.csv"), gen)
  cell2csv( addToPath( data_dir, "gencost.csv"), gencost)
  cell2csv( addToPath( data_dir, "branch.csv"), branch)
  
endfunction
