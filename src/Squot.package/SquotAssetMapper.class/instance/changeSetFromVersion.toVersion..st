changes-creation
changeSetFromVersion: anObject toVersion: anotherObject
	(anObject squotEqual: anotherObject) ifTrue: [^ SquotEmptyChangeSet withMapper: self].
	^ SquotAssetChangeSet withMapper: self from: anObject to: anotherObject