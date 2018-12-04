as yet unclassified
printOn: aStream

	super printOn: aStream. 
	aStream nextPutAll: '(On commit: ''', self commit message,''')'.