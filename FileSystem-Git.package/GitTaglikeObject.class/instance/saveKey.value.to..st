storing
saveKey: key value: value to: aStream
	aStream 
		nextPutAll: key asByteArray; 
		nextPut: Character space asInteger; 
		nextPutAll: value asByteArray; 
		nextPut: Character lf asInteger