as yet unclassified
leftSlot: leftSlot rightSlot: rightSlot
	"If the slot values refer to different origin objects, record a reassignment,
	otherwise queue the slot values to be visited to detect deep changes."
	| rightName |
	(objectsWithChanges includes: leftSlot value undecorated) ifFalse:
		[(referrers at: leftSlot value undecorated ifAbsentPut: [OrderedCollection new])
			add: diffedPair key -> leftSlot.
		(referrers at: rightSlot value undecorated ifAbsentPut: [OrderedCollection new])
			add: diffedPair value -> rightSlot].
	rightSlot value sameIn: left asIn: right ifAbsent:
		[rightName := right nameOf: rightSlot value undecorated ifAbsent: [].
		graphDiff addShadow: rightSlot value named: rightName.
			self addToBeVisitedLeft: nil right: rightSlot value].
	^ (leftSlot value hasSquotShadowName not
		or: [rightSlot value hasSquotShadowName not
		or: [leftSlot value name ~= rightSlot value name]])
		ifTrue: [self reassignSlot: leftSlot to: rightSlot]
		ifFalse: [self addToBeVisitedLeft: leftSlot value right: rightSlot value.
			(objectsWithChanges includes: leftSlot value undecorated)
				ifTrue: [SquotSlotTransitiveChange key: leftSlot key]
				ifFalse: [SquotDiffOfEqualObjects instance]]