comparing
= anObject
	anObject == self ifTrue: [^ true].
	^ (anObject respondsTo: #workingCopy) and: [workingCopy = anObject workingCopy and: [artifact = anObject artifact]]