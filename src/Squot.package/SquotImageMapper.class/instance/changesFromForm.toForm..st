changes-creation
changesFromForm: aForm toForm: anotherForm
	(aForm squotEqual: anotherForm) ifTrue: [^ {}].
	^ { aForm -> anotherForm }