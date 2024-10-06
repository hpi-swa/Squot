changes-creation
changeSetFromSnapshot: aSnapshot  toSnapshot: anotherSnapshot
	| patch |
	patch := anotherSnapshot patchRelativeToBase: aSnapshot.
	patch isEmpty ifTrue: [^ SquotEmptyChangeSet withMapper: self].
	^ SquotCodeChangeSet withMapper: self patch: patch