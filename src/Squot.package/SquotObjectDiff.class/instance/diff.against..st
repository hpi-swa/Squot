initialize-release
diff: leftObjectShadow against: rightShadow
	originalClass := leftObjectShadow originalClass.
	newClass := rightShadow originalClass.
	slotChanges := Dictionary new.
	leftObjectShadow slots associationsDo: [:eachSlot |
		self diffSlot: eachSlot withCorrespondingSlotIn: rightShadow slots].
	(rightShadow slots keys copyWithoutAll: leftObjectShadow slots keys) do: [:eachKey |
		self addSlotOnlyRight: (rightShadow slots associationAt: eachKey)].