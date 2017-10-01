testing
assertConflictMethodHasNotChanged: aTestCase
	aTestCase assert: secondMethodSource
		equals: (sampleClass >> #conflictMethod) getSource asString
		description: 'conflict method unchanged after merge'.