tests
looseObjectStream: anObject
	self assert: (repository objectStores anySatisfy: [:each |
		(each respondsTo: #looseObjectNamed:ifAbsent:)
			and: [each hasObject: anObject hexHash]]).
	^ repository streamObjectNamed: anObject hexHash