printing
printOn: aStream
	aStream nextPutAll: (self name ifNil: '(Unnamed working copy)')