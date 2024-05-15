updating
update: anObject
	super update: anObject.
	(anObject isKindOf: GitReference) ifTrue: [self refChanged: anObject].
	(#(allReferences config) includes: anObject) ifTrue: [self changed: anObject].