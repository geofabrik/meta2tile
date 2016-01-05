# meta2tile
Converts metatiles from tirex (or renderd) to tiles, mbtiles, or zip files.

Usage: meta2tile [options] sourcedir target

Convert .meta files found in source dir to .png in target dir, using the standard "hash" type directory (5-level) for meta tiles and the z/x/y.png structure (3-level) for output.

Options:
* bbox x ::  specify minlon,minlat,maxlon,maxlat to extract only meta tiles intersecting that bbox (default: world).
* list ::  instead of converting all meta tiles in input directory, convert only those given (one per line) on stdin.
* mbtiles ::  instead of writing single tiles to output directory, write a MBTiles file ("target" is a file name then.)
* meta k=v :: set k=v in the MBTiles metadata table (MBTiles spec mandates use of name, type, version, description, format).  Can occur multiple times.
* mode x ::  use in conjunction with --zoom or --bbox; mode=glob is faster if you extract more than 10 percent of files, and mode=stat is faster otherwise.
* shape ::   switch to shape file output mode, in which the "target" is the name of a polygon shape file that has one column named "target" specifying the real target for all tiles that lie inside the respective polygon.
* zoom x ::  specify a single zoomlevel, a number of comma separated zoom levels, or z0-z1 zoom ranges to convert (default: all).
* zip ::  instead of writing single tiles to output directory, write a zip file ("target" is a file name then.)
* verbose :: talk more.

--zoom and --bbox don't make sense with --list;
--mbtiles and --zip are mutually exclusive;
--bbox can be used with --shape but a tile for which no target is defined will not be output even when inside the --bbox range.

Notes for zip output:
* libzip builds the whole zip file in RAM, so be sure to have enough of that when using --zip.
* all versions of libzip released before 10 Nov 2015 are very slow when handling large numbers of files; if you need to create zip files with several GB, it is advisable to get a recent version of libzip.

Note on header files:
The four .h files are taken verbatim from openstreetmap/mod_tile. This program originally lived inside the mod_tile repository and included them directly.
