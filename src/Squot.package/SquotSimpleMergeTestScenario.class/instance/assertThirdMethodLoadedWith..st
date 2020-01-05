asserting
assertThirdMethodLoadedWith: aTestCase
	aTestCase assert: (sampleClass includesSelector: #thirdMethod)
		description: 'third method loaded'.