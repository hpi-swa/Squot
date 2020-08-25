appending
logUpdateFrom: previousHexHash to: nextHexHash by: stamp message: aString
	nextHexHash ifNil: [^ self "probably new repository and branch points nowhere"].
	logfile parent ensureDirectory.
	logfile writeStreamDo: [:stream |
		stream setToEnd;
			nextPutAll: previousHexHash asHexHash;
			space;
			nextPutAll: nextHexHash asHexHash;
			space;
			nextPutAll: stamp printString;
			tab;
			nextPutAll: aString withoutLineEndings;
			lf].