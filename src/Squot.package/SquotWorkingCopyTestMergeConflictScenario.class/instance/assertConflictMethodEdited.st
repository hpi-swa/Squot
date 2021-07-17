asserting
assertConflictMethodEdited
	
	testCase 
		assert: sampleClass new conflictMethod = 3
		description: 'conflict method should have changed during merge'.