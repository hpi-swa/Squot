commands
outputStream
	^ outputStream ifNil: [ outputStream := '' writeStream ]