converting
asReferenceDiffWithDefaultOwners: leftAndRightShadows reflectedIn: aMirror
	^ SquotReferenceAddition
		to: leftAndRightShadows first
		reference: self slotToBeAdded asReference
		target: self slotToBeAdded value
		rightOwner: leftAndRightShadows second