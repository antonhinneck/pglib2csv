# pglib2csv

Automated download and csv conversion of pglib-opf-cases, written in Ocatve (Matlab compatible).

## Usage

To use the script, install Octave (https://www.gnu.org/software/octave/) - or MATLAB.
Clone the repository, and run the script *pglib2csv.m*.
In the directory *./pglib*, a new folder is going to be created, containing the latest data from the pglib library (https://github.com/power-grid-lib/pglib-opf), as csv files.

The package PowerGrids.jl (https://github.com/antonhinneck/PowerGrids.jl) provides a data loader for Julia (https://julialang.org/).
As of right now, it is fully compatible with the csv files created by this script.

## Upcoming

Configuration with PowerGrids.jl requires a manual setup process. Running *./pglib* will contain the option to set a system path variable for seemless integration in the future.

A python interface is going to be written next.
