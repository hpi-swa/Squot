printing
printOn: aStream
	super printOn: aStream.
	aStream nextPutAll: ' (';
		print: containerConflicts size;
		nextPutAll: ' conflicts, ';
		print: containerModifications size;
		nextPutAll: ' changes, ';
		print: elementMerges size;
		nextPutAll: ' merges)'.