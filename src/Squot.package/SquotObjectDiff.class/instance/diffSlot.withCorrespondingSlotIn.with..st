initialize-release
diffSlot: leftSlot withCorrespondingSlotIn: rightSlots with: aDiffBuilder
	| rightSlot slotDiff |
	rightSlot := rightSlots associationAt: leftSlot key
		ifAbsent: [^ slotChanges add:
				(SquotSlotRemoval key: leftSlot key removedSlot: leftSlot)].
	slotDiff := leftSlot squotDiffAgainst: rightSlot with: aDiffBuilder.
	slotDiff squotHasChanges ifFalse: [^ self].
	slotChanges add: slotDiff.