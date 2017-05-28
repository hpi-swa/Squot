as yet unclassified
applyOnTopOf: otherPatch
	"Answer a patch that is equivalent to applying first otherPatch and then me."
	| newDiffs |
	newDiffs := otherPatch diffs copy.
	diffs keysAndValuesDo: [:path :each |
		(newDiffs includesKey: path)
			ifTrue: [newDiffs at: path put: (each applyOnTopOf: (newDiffs at: path))]
			ifFalse: [newDiffs at: path put: each]].
	^ SquotPatch with: newDiffs