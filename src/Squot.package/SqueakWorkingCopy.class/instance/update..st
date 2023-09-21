updating
update: anObject
	super update: anObject.
	(anObject isKindOf: GitReference) ifTrue: [self refChanged: anObject].
	anObject = #config ifTrue: [self changed: #config].