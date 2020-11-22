asserting
assertSecondMethodUnmodifiedWith: aTestCase
	self updateSampleClass.
	aTestCase
		assert: secondMethod
		equals: sampleClass >> #secondMethod
		description: 'second method unchanged'.