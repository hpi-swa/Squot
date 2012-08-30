operations-writing
writePackFileHeaderOn: aStream
	aStream
		nextPutAll: self packFileIdentifier;
		nextPutAll: self versionNumber;
		nextPutAll: (self numberOfObjects asByteArrayOfSize: 4)