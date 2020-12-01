asserting
assertThirdMethodLoadedWith: aTestCase
	self updateSampleClass.
	aTestCase assert: (sampleClass includesSelector: #thirdMethod)
		description: 'third method loaded'.