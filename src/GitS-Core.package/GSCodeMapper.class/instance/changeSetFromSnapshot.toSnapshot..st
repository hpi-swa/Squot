changes-creation
changeSetFromSnapshot: aSnapshot  toSnapshot: anotherSnapshot
	| patch |
	patch := anotherSnapshot patchRelativeToBase: aSnapshot.
	patch isEmpty ifTrue: [^ GSEmptyChangeSet withMapper: self].
	^ GSCodeChangeSet withMapper: self patch: patch