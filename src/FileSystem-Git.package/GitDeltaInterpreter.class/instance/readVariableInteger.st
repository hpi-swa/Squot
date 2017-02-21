processing
readVariableInteger
"modified little endian encoding.
Most significant bit of each byte indicates if that byte is the last
byte encoding for the value (bit = 0) or if another byte follows (bit = 1)"
	| value shift byte |
	value := 0.
	shift := 0.
	[ byte := commands next.
	value := value bitOr: ((byte bitAnd: 127) << shift).
	shift := shift + 7 ] doWhileFalse: [ (byte bitAnd: 128) isZero ].
	
	^ value