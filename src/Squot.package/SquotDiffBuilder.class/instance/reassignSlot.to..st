as yet unclassified
reassignSlot: leftSlot to: rightSlot
	leftSlot value = rightSlot value
		ifTrue: [^ SquotDiffOfEqualObjects instance].
	^ SquotSlotReassignment
		key: leftSlot key
		leftShadow: leftSlot value
		rightShadow: rightSlot value