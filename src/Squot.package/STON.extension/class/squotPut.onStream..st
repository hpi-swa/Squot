*Squot-serialization
squotPut: anObject onStream: aStream
	"Write anObject pretty-printed and with unix line endings to aStream"
	^ (self writer on: aStream)
		newLine: String lf;
		prettyPrint: true;
		nextPut: anObject