Squot-diff-enumerating
referenceDiffsWithDefaultOwners: leftAndRightShadows reflectedIn: aMirror do: aBlock
	"Evaluate aBlock with a pseudo-diff for each pseudo-reference to patched objects in the graph."
	^ graphDiff diffsWithNamesDo:
		[:each :name | | left right reference |
		each isAddition ifFalse:
			[reference := SquotObjectGraphReference new
							objectDiff: each;
							objectName: name;
							yourself.
			left := graphDiff left shadowNamed: name ifAbsent: [].
			right := graphDiff right shadowNamed: name ifAbsent: [].
			aBlock value:
				(SquotObjectGraphDiffKickoffReference reference: reference leftOwner: graphDiff left reflectedIn: aMirror rightOwner: graphDiff right reflectedIn: aMirror objectDiff: each)]]