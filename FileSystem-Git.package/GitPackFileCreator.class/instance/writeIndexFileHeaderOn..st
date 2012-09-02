operations-writing-index
writeIndexFileHeaderOn: aStream
	aStream
		nextPutAll: self indexFileIdentifier;
		nextPutAll: self versionNumber