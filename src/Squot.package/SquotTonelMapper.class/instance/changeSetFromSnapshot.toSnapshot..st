changes-creation
changeSetFromSnapshot: aSnapshot  toSnapshot: anotherSnapshot
	| patch |
	patch := anotherSnapshot patchRelativeToBase: aSnapshot.
	patch isEmpty ifTrue: [^ SquotEmptyChangeSet withMapper: self].
	^ SquotTonelChangeSet withMapper: self patch: patch