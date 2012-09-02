tests
testMakeLightTag
	GitTag makeLightWeightTag: 'testTag' for: repository head in: repository.	
	self assert: (repository tagsDir / 'testTag') exists