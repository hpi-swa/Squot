processing
readUnpackedDataSize
	| size shift byte |
	"OTTTSSSS		O = overflow, 1 if more lines follow,
	 1SSSSSSS   	T = type of pack file,
	 ...        	S = size
	 0SSSSSSS
	 
	Then, the S bits are interpreted with least significant bytes appearing first.
	[ 7 bits from byte-n ] [ 7 bits from byte-n-1 ] ... [ 7 bits from byte-1 ] [ 4 bits from byte-0 ]
	"
	byte := self sourceStream next.
	size := byte bitAnd: 2r00001111. "last 4 bits are the first 4 bits containing the size."
	shift := 4.
	[ (byte bitAnd: 2r10000000) isZero "overflow?" ] whileFalse: [
		byte := self sourceStream next.
		size := size bitOr: ((byte bitAnd: 2r01111111) << shift).
		shift := shift + 7].
	
	^ size