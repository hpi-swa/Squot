updating
update: anObject
	super update: anObject.
	(anObject isKindOf: GitReference) ifTrue: [self refChanged: anObject].
	anObject = #allReferences ifTrue: [self refsChanged].