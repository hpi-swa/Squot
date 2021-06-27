Squot-diff-enumerating
referenceDiffsWithDefaultOwners: leftAndRightShadows reflectedIn: aMirror do: aBlock
	"Allow the replacement to be materialized proper. Like with an addition, enumerate all references to update their values."
	^ (aMirror referencesFrom: right)
		collect:
			[:each | SquotReferenceTargetExchange
				reference: each
				leftOwner: left target: ((left class squotMirror flag: #stub "referrers in the graph might want to use a different mirror") reflect: (each flag: #todo "the left object might not even be of the same class, so it might not have this reference!") of: left)
				rightOwner: right target: (aMirror reflect: each of: right)]
		thenDo: aBlock