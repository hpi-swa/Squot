testing
canDecode: byteTypeCode
	^ (byteTypeCode bitXor: self packedRefsBinaryCode) isZero