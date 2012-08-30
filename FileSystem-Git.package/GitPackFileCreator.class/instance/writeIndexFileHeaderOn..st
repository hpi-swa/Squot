operations-writing
writeIndexFileHeaderOn: aStream
	aStream
		nextPutAll: self indexFileIdentifier;
		nextPutAll: self versionNumber