testing
canDecode: byteTypeCode 
	"all types but OFS_DELTA and REF_DELTA"
	^ (byteTypeCode bitXor: self packedRefsBinaryCode) isZero not
		and: [ (byteTypeCode bitXor: self packedOfsBinaryCode) isZero not ]