converting
asReferenceDiffWithDefaultOwners: leftAndRightShadows reflectedIn: aMirror
	^ SquotReferenceRemoval
		from: leftAndRightShadows first
		reference: self slotToBeRemoved asReference
		rightObject: leftAndRightShadows second