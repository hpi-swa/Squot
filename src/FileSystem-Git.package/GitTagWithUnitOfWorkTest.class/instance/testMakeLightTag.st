tests
testMakeLightTag
	GitLightweightTag named: 'testTag' for: repository unitOfWork head in: repository.	
	self assert: (repository unitOfWork resolveRef: 'refs/tags/testTag') notNil.