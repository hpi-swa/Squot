converting
asReferenceDiffWithDefaultOwners: leftAndRightShadows reflectedIn: aMirror
	^ SquotReferenceRemoval
		of: self slotToBeRemoved value
		from: leftAndRightShadows first
		reference: self slotToBeRemoved asReference
		rightObject: leftAndRightShadows second