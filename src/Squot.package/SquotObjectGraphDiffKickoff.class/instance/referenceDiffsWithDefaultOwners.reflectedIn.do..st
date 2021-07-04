Squot-diff-enumerating
referenceDiffsWithDefaultOwners: leftAndRightShadows reflectedIn: aMirror do: aBlock
	"Evaluate aBlock with a pseudo-diff for each pseudo-reference to patched objects in the graph."
	^ graphDiff diffsWithNamesDo:
		[:each :name | | left right rightName reference isForStart |
		each isAddition ifFalse:
			[rightName := each rightName ifNil: [name].
			reference := SquotObjectGraphReference new
							objectDiff: each;
							objectName: rightName;
							yourself.
			left := graphDiff left shadowNamed: name ifAbsent: [].
			right := graphDiff right shadowNamed: rightName ifAbsent: [].
			isForStart := each == graphDiff startDiff.
			aBlock value:
				((isForStart ifTrue: [SquotObjectGraphDiffKickoffStartReference] ifFalse: [SquotObjectGraphDiffKickoffReference]) reference: reference leftOwner: graphDiff left reflectedIn: aMirror rightOwner: graphDiff right reflectedIn: aMirror objectDiff: each)]]