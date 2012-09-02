private
boundsFor: hexHash
	| fanoutIndex |
	"get highest possible index from fanout table:
	160 bit hash. We want the upper 8 bits."
	fanoutIndex := hexHash asIntegerHash >> 152. 

	^ { 
		"lower boundary is at the next lower fanout index"
		self indexForFanout: fanoutIndex - 1.
		self indexForFanout: fanoutIndex }