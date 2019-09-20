initialize-release
diffSlot: leftSlot withCorrespondingSlotIn: rightSlots
	| rightSlot slotDiff |
	rightSlot := rightSlots associationAt: leftSlot key
		ifAbsent: [^ slotChanges add:
				(SquotSlotRemoval key: leftSlot key removedSlot: leftSlot)].
	slotDiff := leftSlot squotDiffAgainst: rightSlot.
	slotDiff squotHasChanges ifFalse: [^ self].
	^ slotChanges add: slotDiff