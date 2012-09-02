storing
saveKey: key value: value to: aStream
	aStream 
		nextPutAll: key; space; 
		nextPutAll: value; lf.