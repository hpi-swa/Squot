testing
canDecode: byteTypeCode
	^ (byteTypeCode bitXor: 2r01110000) isZero