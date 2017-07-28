private
writeData: aString
	Transcript show: '> ', aString; cr; cr.
	stream nextPutAll: aString asByteArray.
	^ aString