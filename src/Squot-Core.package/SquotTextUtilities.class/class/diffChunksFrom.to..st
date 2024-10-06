diffing
diffChunksFrom: fromCollection to: toCollection
	(fromCollection size = 0 and: [toCollection size = 0]) ifTrue: [
		"MyersUkkonenDiff doesn't properly handle this case"
		^ {#common -> fromCollection}].
	^ self diffClass new
		file1: fromCollection;
		file2: toCollection;
		comm