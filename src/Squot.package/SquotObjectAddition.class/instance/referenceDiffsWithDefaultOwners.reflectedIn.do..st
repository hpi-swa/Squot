Squot-diff-enumerating
referenceDiffsWithDefaultOwners: leftAndRightShadows reflectedIn: aMirror do: aBlock
	"Pretend to update all the references of my object with their new values."
	^ (aMirror referencesFrom: addedObject)
		collect:
			[:each | SquotReferenceTargetExchange
				reference: each
				leftOwner: nil target: nil
				rightOwner: addedObject target: (aMirror reflect: each of: addedObject)]
		thenDo: aBlock