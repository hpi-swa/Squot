operations-writing
writeObjectHeader: anObject on: aStream
	| type size byte |
	type := anObject class byteTypeCode. "e.g. 2r00110000"
	size := anObject size.
	
	byte := type bitOr: (size bitAnd: 2r00001111).
	size := size bitShift: -4.
	[ size > 0 ] whileTrue: [
		aStream nextPut: (byte bitOr: 2r10000000).
		byte := size bitAnd: 2r01111111.
		size := size bitShift: -7 ].
	aStream nextPut: byte