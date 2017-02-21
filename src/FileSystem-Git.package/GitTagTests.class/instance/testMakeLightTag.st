tests
testMakeLightTag
	GitLightweightTag named: 'testTag' for: repository head in: repository.	
	self assert: (repository tagsDir / 'testTag') exists