helpers
getEntryHeadersAt: position
"The most significant bit of every header byte states if the current byte is followed
by another header byte or by data.
First bit = 1: another header byte follows.
First bit = 0: data follows.
Thus, the n header bytes of an entry consist of n-1 bytes who's most significant
bit is 1 and 1 byte who's most significant bit is 0."
	| bytes oldPosition |
	oldPosition := packReader position.
	packReader position: position.
	bytes := ByteArray streamContents: [ :stream |			
		[ (packReader peek bitAnd: 2r10000000) isZero ] whileFalse:
			[ stream nextPut: packReader next ].
		stream nextPut: packReader next ].
	
	packReader position: oldPosition.
	^ bytes readStream 