as yet unclassified
outputStream
	^ outputStream ifNil: [ outputStream := '' writeStream ]