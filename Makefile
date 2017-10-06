# if you don't need multi-target output you can drop WITH_SHAPE and -lgdal -lgeos_c
# if you don't need mbtiles you can drop WITH_MBTILES and -lsqlite
# if you don't need zip output drop WITH_ZIP and -lzip
# if you don't need PNG->JPEG conversion drop WITH_JPEG and -lgd

meta2tile: meta2tile.c 
	gcc -DWITH_ZIP -DWITH_SHAPE -DWITH_MBTILES -DWITH_JPEG -g -std=gnu99 -I /usr/include/gdal -I/usr/include  meta2tile.c -o meta2tile -lsqlite3 -lm -lgeos_c -lcrypto -lzip  -lgdal -lz -lgd

