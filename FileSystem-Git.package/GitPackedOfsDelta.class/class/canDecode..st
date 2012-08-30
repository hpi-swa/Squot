testing
canDecode: byteTypeCode
	^ (byteTypeCode bitXor: 2r01100000) isZero