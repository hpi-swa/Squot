tests
testMakeLightTag
	GitLightweightTag named: 'testTag' for: repository unitOfWork head in: repository.	
	self assert: (repository tagsDir / 'testTag') exists;
		assert: (self unitOfWork resolveRef: 'refs/tags/testTag') notNil.