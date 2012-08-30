processing
readUnpackedDataSize
	| size shift byte |
	byte := file next.
	packedLength := packedLength + 1.
	size := byte bitAnd: 2r00001111.
	shift := 4.
	[ (byte bitAnd: 2r10000000) isZero ] whileFalse: [
		byte := file next.
		packedLength := packedLength + 1.
		size := size bitOr: ((byte bitAnd: 127) << shift).
		shift := shift + 7].
	
	^ size