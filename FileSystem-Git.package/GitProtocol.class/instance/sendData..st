accessing
sendData: aString
	Transcript show: aString; cr; cr.
	self outputStream nextPutAll: aString.
	self flush.
	^ aString