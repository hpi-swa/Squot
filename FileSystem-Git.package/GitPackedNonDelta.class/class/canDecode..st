testing
canDecode: byteTypeCode 
	"all types but OFS_DELTA and REF_DELTA"
	^ (byteTypeCode bitXor: 2r01100000) isZero not
		and: [ (byteTypeCode bitXor: 2r01110000) isZero not ]