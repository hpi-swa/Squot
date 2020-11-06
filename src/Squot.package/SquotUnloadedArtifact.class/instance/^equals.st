comparing
= anObject
	^ (anObject respondsTo: #workingCopy) and: [workingCopy = anObject workingCopy and: [artifact = anObject artifact]]