accessing
byteTypeCodeFrom: aStream
	"First bit is named the size extension bit. It is 1 if there are more bytes to follow.
	 The next 3 bits define the type of the packed object."
	^ aStream peek bitAnd: 2r01110000