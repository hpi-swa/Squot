snapshot-creation
readerOn: aReference
	^ (self readerClass on: aReference)
		fileUtils: (self fileUtilsOn: aReference);
		packageDirectory: aReference pathString;
		yourself