class-tests
looseObjectStream: anObject
	self assert: (self unitOfWork objectStores anySatisfy: [:each |
		(each respondsTo: #looseObjectNamed:ifAbsent:)
			and: [each hasObject: anObject hexHash]]).
	^ self unitOfWork streamObjectNamed: anObject hexHash