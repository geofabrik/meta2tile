# meta2tile
Converts metatiles from tirex (or renderd) to tiles, mbtiles, or zip files.

Usage: meta2tile [options] sourcedir target

Convert .meta files found in source dir to .png in target dir, using the standard "hash" type directory (5-level) for meta tiles and the z/x/y.png structure (3-level) for output.

Options:
* bbox x ::  specify minlon,minlat,maxlon,maxlat to extract only meta tiles intersecting that bbox (default: world).
* list ::  instead of converting all meta tiles in input directory, convert only those given (one per line) on stdin.
* mbtiles ::  instead of writing single tiles to output directory, write a MBTiles file ("target" is a file name then.)
* meta k=v :: set k=v in the MBTiles metadata table (MBTiles spec mandates use of name, type, version, description, format).  Can occur multiple times.
* mode x ::  use in conjunction with --bbox; mode=glob is faster if you extract more than 10 percent of files, and mode=stat is faster otherwise.
* shape ::   switch to shape file output mode, in which the "target" is the name of a polygon shape file that has one column named "target" specifying the real target for all tiles that lie inside the respective polygon.
* zip ::  instead of writing single tiles to output directory, write a zip file ("target" is a file name then.)
* verbose :: talk more.

--bbox doesn't make sense with --list;
--mbtiles and --zip are mutually exclusive;
--bbox can be used with --shape but a tile for which no target is defined will not be output even when inside the --bbox range.

There used to be a --zoom option to limit the output to certain zoom levels but it did not work well; to convert just a few zoom levels, run the command several times OR symlink the zoom level directories into a common parent and runn the command on that parent.

Notes for zip output:
* libzip builds the whole zip file in RAM, so be sure to have enough of that when using --zip.
* pre-1.1 versions of libzip are very slow when handling large numbers of files; if you need to create zip files with several GB, it is advisable to get at least version 1.1 of libzip.

Note on header files:
The four .h files are taken verbatim from openstreetmap/mod_tile. This program originally lived inside the mod_tile repository and included them directly.
