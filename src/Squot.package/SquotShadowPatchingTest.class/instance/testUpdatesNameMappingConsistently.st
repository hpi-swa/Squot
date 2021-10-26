tests
testUpdatesNameMappingConsistently
	| unchangedArray original name decoratorName |
	self patchGraph.
	unchangedArray := (patchedGraph startShadow slots at: 3) slots at: 1.
	original := diff left startShadow slots at: 3.
	name := diff left nameOf: original undecorated.
	decoratorName := unchangedArray name.
	self assert: (patchedGraph shadowNamed: name) == unchangedArray undecorated
		description: 'name mapping should be consistent with graph';
		assert: (patchedGraph shadowNamed: decoratorName) == unchangedArray undecorated
		description: 'decorated objects should be retrievable by name';
		assert: (patchedGraph nameOf: unchangedArray undecorated ifAbsent: []) notNil
		description: 'must be possible to look up the name of a reached object';
		assert: decoratorName equals: (patchedGraph nameOf: unchangedArray undecorated ifAbsent: [])
		description: 'names should be consistent with the decoration'.