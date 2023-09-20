printing
printOn: aStream
	aStream 
		nextPutAll: self assetTypeName;
		nextPutAll: ' at '.
	self path asReference printOn: aStream.