writing
nextPut: anObject
	(isBinary or: [anObject isInteger]) ifTrue: [^ self basicNextPut: anObject].
	^ self converter nextPut: anObject toStream: self