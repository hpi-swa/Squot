asserting
assertSecondMethodUnmodifiedWith: aTestCase
	self updateSampleClass.
	aTestCase
		assert: (secondMethod equivalentTo: sampleClass >> #secondMethod)
		description: 'second method unchanged'.