## Repo Management
#-----------------

pkg load io;
addpath(genpath(pwd));

# Script
#-------

init_dir = pwd;
root_dir = addToPath( init_dir, "pglib" )

if ~exist(root_dir, "dir")
   mkdir(root_dir);
end

cd(root_dir)

timestamp = datestr(now,'yyyy-mm-dd.HH-MM-SS-FFF');
mkdir( timestamp );

work_dir = addToPath( root_dir, timestamp );
csv_dir = addToPath( work_dir, "csv" );
mkdir( csv_dir );
cd( work_dir );

filename = "pglib_archive.master.zip";
pglib_archive = urlwrite("https://github.com/power-grid-lib/pglib-opf/archive/master.zip", filename);
unzip(filename);

unpacked_dir = addToPath( work_dir, "pglib-opf-master" ) #getSubDirs( dir ){2, 1};
cd( unpacked_dir );

m_files = listDotMFiles( dir );

for i = 1:length(m_files)

  case2csv(stripDotM(m_files{i,1}), csv_dir)
  
end

cd( unpacked_dir );

# sad cases
#----------

unpacked_dir_sad = addToPath( unpacked_dir, "sad" );
csv_dir_sad = addToPath(  csv_dir, "sad" );
mkdir( csv_dir_sad );

cd( unpacked_dir_sad );
m_files = listDotMFiles( dir );

for i = 1:length(m_files)

  case2csv(stripDotM(m_files{i,1}), csv_dir_sad);
  
end

cd( unpacked_dir );

# api cases
#----------

unpacked_dir_api = addToPath( unpacked_dir, "api" );
csv_dir_api = addToPath(  csv_dir, "api" );
mkdir( csv_dir_api );

cd( unpacked_dir_api );
m_files = listDotMFiles( dir );

for i = 1:length(m_files)

  case2csv(stripDotM(m_files{i,1}), csv_dir_api );
  
end

cd( work_dir );

