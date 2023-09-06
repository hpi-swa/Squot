changes-creation
changeSetFromForm: aForm toForm: anotherForm
	(aForm squotEqual: anotherForm) ifTrue: [^ SquotEmptyChangeSet withMapper: self].
	^ SquotImageChangeSet withMapper: self from: aForm to: anotherForm