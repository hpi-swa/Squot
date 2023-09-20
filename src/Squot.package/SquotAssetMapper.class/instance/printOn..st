printing
printOn: aStream
	aStream 
		nextPutAll: self assetTypeName;
		nextPutAll: ' at ';
		nextPutAll: (SquotPathUtilities asString: self path);
		nextPutAll: ' encoded using ';
		nextPutAll: self encodingName.