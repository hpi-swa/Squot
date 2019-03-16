accessing
author: aString 
	self directory ensureDirectory / 'author' writeStreamDo:
		[:stream |
		stream nextPutAll: aString].