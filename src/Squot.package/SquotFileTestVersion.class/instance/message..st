accessing
message: aString
	self directory ensureDirectory / 'message' writeStreamDo:
		[:stream |
		stream nextPutAll: aString]