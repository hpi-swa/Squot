tests
looseObjectStream: anObject
	self assert: (repository unitOfWork objectStores anySatisfy: [:each |
		(each respondsTo: #looseObjectNamed:ifAbsent:)
			and: [each hasObject: anObject hexHash]]).
	^ repository unitOfWork streamObjectNamed: anObject hexHash