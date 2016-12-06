private connection
outputStream
	^ outputStream ifNil: [ outputStream := '' writeStream ]