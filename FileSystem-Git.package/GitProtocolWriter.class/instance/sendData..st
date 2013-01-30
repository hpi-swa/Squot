private sending
sendData: aString
	Transcript show: aString; cr; cr.
	stream nextPutAll: aString.
	self flush.
	^ aString