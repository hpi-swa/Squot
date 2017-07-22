private accessing
add: aSlot toSlotOverridesOf: anObject
	^ (self slotOverrides at: anObject ifAbsentPut: [Dictionary new])
		add: aSlot