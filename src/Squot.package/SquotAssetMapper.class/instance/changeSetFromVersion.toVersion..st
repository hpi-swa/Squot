changes-creation
changeSetFromVersion: anObject toVersion: anotherObject
	(anObject squotEqual: anotherObject) ifTrue: [^ SquotEmptyChangeSet withMapper: self].
	^ self changeSetClass withMapper: self from: anObject to: anotherObject