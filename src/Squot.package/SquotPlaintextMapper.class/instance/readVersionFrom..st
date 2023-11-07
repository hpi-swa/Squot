version-io
readVersionFrom: aStream
	aStream reset; ascii.
	^ self toPlaintext: aStream contents