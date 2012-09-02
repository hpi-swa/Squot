helpers
getSizeFromHeaders: aStream
"aStream contains the n header bytes of a pack entry.
The bytes are in network byte order (last  byte is most significant).
The last four bits of the first byte are the four least significant
bits of the bits describing the size of the following data. 
The number of bits describing the size of the data is (n - 1) * 7 + 4.
Note that the most significant bit of each byte encodes if another header
byte follows or not and thus has to be stripped (#bitAnd:) from the bits
that describe the size.
The four bits from the first byte do not need to be shifted. The following
bits need to be shifted to the left so that they make up the most significant
part of the bits already present."
	| size shift byte |
	byte := aStream next.
	size := byte bitAnd: 2r00001111.
	shift := 4.
	[ (byte bitAnd: 2r10000000) isZero ] whileFalse: [
		byte := aStream next.
		size := size bitOr: ((byte bitAnd: 2r01111111) bitShift: shift).
		shift := shift + 7 ].
	
	^ size