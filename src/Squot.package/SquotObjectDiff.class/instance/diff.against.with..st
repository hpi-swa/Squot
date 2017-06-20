initialize-release
diff: leftObjectShadow against: rightShadow with: aDiffBuilder
	originalClass := leftObjectShadow originalClass.
	slotChanges := Dictionary new.
	leftObjectShadow slots associationsDo: [:eachSlot |
		self diffSlot: eachSlot withCorrespondingSlotIn: rightShadow slots with: aDiffBuilder].
	(rightShadow slots keys difference: leftObjectShadow slots keys) do: [:eachKey |
		self addSlotOnlyRight: (rightShadow slots associationAt: eachKey) with: aDiffBuilder].