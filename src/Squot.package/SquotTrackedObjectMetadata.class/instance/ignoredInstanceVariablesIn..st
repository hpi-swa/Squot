accessing
ignoredInstanceVariablesIn: anObject
	self ignoredInstanceVariables
		at: anObject
		ifPresent: [:them | ^ them]
		ifAbsent: [#()]