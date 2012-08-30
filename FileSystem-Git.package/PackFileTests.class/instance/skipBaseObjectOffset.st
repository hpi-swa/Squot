helpers
skipBaseObjectOffset
"The base object offset has a special encoding (basically it is the
same encoding used for encoding the size of object data).
See http://git.rsbx.net/Documents/Git_Data_Formats.txt.
This is the Smalltalk code that would decode the offset:

| byte offset |
	byte := packReader next.
	offset := byte bitAnd: 2r01111111.
	[ (byte bitAnd: 2r10000000) isZero ] whileFalse: [
		byte := packReader next.
		offset := ((offset + 1) bitShift: 7) bitOr: (byte bitAnd: 2r01111111) ]"
	
	self skipEntryHeader "same code"