toolbuilder
update: anObject
	super update: anObject.
	anObject = self buildSelector ifTrue: [self changed: #buildChildren].