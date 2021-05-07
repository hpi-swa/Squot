accessing
timestamp: aDateAndTime
	(self directory / 'timestamp') writeStreamDo:
		[:stream |
		stream truncate; nextPutAll: aDateAndTime printString].