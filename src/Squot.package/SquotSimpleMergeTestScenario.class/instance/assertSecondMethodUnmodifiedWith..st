asserting
assertSecondMethodUnmodifiedWith: aTestCase
	aTestCase
		assert: secondMethod
		equals: sampleClass >> #secondMethod
		description: 'second method unchanged'.