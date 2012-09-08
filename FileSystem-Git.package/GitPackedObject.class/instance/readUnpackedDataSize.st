processing
readUnpackedDataSize
	| size shift byte |
	byte := self sourceStream next.
	size := byte bitAnd: 2r00001111.
	shift := 4.
	[ (byte bitAnd: 2r10000000) isZero ] whileFalse: [
		byte := self sourceStream next.
		size := size bitOr: ((byte bitAnd: 127) << shift).
		shift := shift + 7].
	
	^ size