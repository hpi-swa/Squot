as yet unclassified
printOn: aStream

	super printOn: aStream.
	aStream nextPutAll: '(''', self path, ''')'.