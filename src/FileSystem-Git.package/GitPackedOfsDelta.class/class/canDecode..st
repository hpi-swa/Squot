testing
canDecode: byteTypeCode
	^ (byteTypeCode bitXor: self packedOfsBinaryCode) isZero