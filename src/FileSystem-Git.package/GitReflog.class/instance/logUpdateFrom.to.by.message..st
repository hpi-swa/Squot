appending
logUpdateFrom: previousHexHash to: nextHexHash by: stamp message: aString
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