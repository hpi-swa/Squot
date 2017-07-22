private
replacementForSlot: aShadowSlot in: anObject ifFound: unaryBlock ifNone: noneBlock
	"If there are settings for a slot to be initialized to a default-value, capture that."
	slotValueReplacements at: anObject ifPresent:
		[:slots | slots at: aShadowSlot key ifPresent: [:it | ^ it]].
	^ SquotActiveSlotOverrides
		replacementForSlot: aShadowSlot in: anObject
		ifFound: [:replacement |
			(slotValueReplacements at: anObject ifAbsentPut: [Dictionary new])
				at: aShadowSlot key put: replacement.
			unaryBlock value: replacement]
		ifNone: noneBlock