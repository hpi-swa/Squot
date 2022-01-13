Squot-diff-enumerating
referenceDiffsWithDefaultOwners: leftAndRightShadows reflectedIn: aMirror do: aBlock
	"Allow the replacement to be materialized proper. Like with an addition, enumerate all references to update their values."
	| leftUndecorated rightUndecorated leftMirror sameMirror |
	leftUndecorated := left undecorated.
	rightUndecorated := right undecorated.
	leftMirror := leftUndecorated class squotMirror.
	sameMirror := leftMirror = aMirror.
	^ (aMirror referencesFrom: rightUndecorated)
		collect:
			[:each | SquotReferenceTargetExchange
				reference: each
				leftOwner: leftUndecorated target: (sameMirror ifTrue: [leftMirror reflect: each of: leftUndecorated])
				rightOwner: rightUndecorated target: (aMirror reflect: each of: rightUndecorated)]
		thenDo: aBlock