updating
update: anObject
	super update: anObject.
	anObject = self getWorkingCopySelector ifTrue: [self changed: #project].
	anObject = #registry ifTrue: [self registryChanged].