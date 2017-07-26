as yet unclassified
leftSlot: leftSlot rightSlot: rightSlot
	"If the slot values refer to different origin objects, record a reassignment,
	otherwise queue the slot values to be visited to detect deep changes."
	(objectsWithChanges includes: leftSlot value) ifFalse:
		[(referrers at: leftSlot value undecorated ifAbsentPut: [OrderedCollection new])
			add: diffedPair key -> leftSlot.
		(referrers at: rightSlot value undecorated ifAbsentPut: [OrderedCollection new])
			add: diffedPair value -> rightSlot].
	^ (leftSlot value hasSquotShadowName not
		or: [rightSlot value hasSquotShadowName not
		or: [leftSlot value name ~= rightSlot value name]])
		ifTrue: [self reassignSlot: leftSlot to: rightSlot]
		ifFalse: [self addToBeVisitedLeft: leftSlot value right: rightSlot value.
			SquotDiffOfEqualObjects instance]