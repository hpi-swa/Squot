as yet unclassified
leftSlot: leftSlot rightSlot: rightSlot
	self addToBeVisitedLeft: leftSlot value right: rightSlot value.
	^ (leftSlot value hasSquotShadowName not
		or: [rightSlot value hasSquotShadowName not
		or: [leftSlot value name ~= rightSlot value name]])
		ifTrue: [self reassignSlot: leftSlot to: rightSlot]
		ifFalse: [SquotDiffOfEqualObjects instance]