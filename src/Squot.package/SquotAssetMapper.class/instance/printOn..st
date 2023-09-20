printing
printOn: aStream
	aStream 
		nextPutAll: self assetTypeName;
		nextPutAll: ' at ';
		nextPutAll: (SquotPathUtilities asString: self path).