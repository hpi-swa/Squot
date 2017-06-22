adding
add: aSlot of: creator asCreatorOf: anObject
	objectCreators at: anObject put: creator.
	objectCreatorSlots at: anObject put: aSlot. 