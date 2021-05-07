instance creation
readFrom: aStream
	^ self basicNew
		readFrom: aStream;
		beReadOnlyObject;
		yourself