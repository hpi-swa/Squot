accessing
creatorOf: anObject ifAbsentPut: slotBlock of: creatorBlock
	^ objectCreators at: anObject
		ifAbsentPut: [objectCreatorSlots at: anObject put: slotBlock value.
			creatorBlock value]