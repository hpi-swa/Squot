showing
showOn: aStream
	aStream
		nextPutAll: self name;
		nextPutAll: ' <'; nextPutAll: self email; nextPutAll: '> '.
	self showTimeStampOn: aStream.