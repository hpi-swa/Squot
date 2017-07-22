accessing
slotOverrideFor: aShadowSlot in: anObject ifFound: unaryBlock ifNone: noneBlock
	^ (self slotOverrides at: anObject ifAbsent: [^ noneBlock value])
		at: aShadowSlot key
		ifPresent: unaryBlock
		ifAbsent: noneBlock