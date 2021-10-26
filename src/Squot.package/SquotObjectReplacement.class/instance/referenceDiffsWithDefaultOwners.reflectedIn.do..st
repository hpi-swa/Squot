Squot-diff-enumerating
referenceDiffsWithDefaultOwners: leftAndRightShadows reflectedIn: aMirror do: aBlock
	"Allow the replacement to be materialized proper. Like with an addition, enumerate all references to update their values."
	| leftMirror sameMirror |
	leftMirror := left class squotMirror.
	sameMirror := left class squotMirror = aMirror.
	^ (aMirror referencesFrom: right)
		collect:
			[:each | SquotReferenceTargetExchange
				reference: each
				leftOwner: left target: (sameMirror ifTrue: [leftMirror reflect: each of: left])
				rightOwner: right target: (aMirror reflect: each of: right)]
		thenDo: aBlock