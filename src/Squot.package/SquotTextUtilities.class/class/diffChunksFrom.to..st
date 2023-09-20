diffing
diffChunksFrom: fromCollection to: toCollection
	^ self diffClass new
		file1: fromCollection;
		file2: toCollection;
		comm