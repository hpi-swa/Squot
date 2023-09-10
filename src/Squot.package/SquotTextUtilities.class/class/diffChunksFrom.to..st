diffing
diffChunksFrom: fromString to: toString
	^ self diffClass new
		file1: fromString lines;
		file2: toString lines;
		comm