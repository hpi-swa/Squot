tests
testReadingLightTag
	GitLightweightTag named: 'testTag' for: repository unitOfWork head in: repository.
	
	self assert: (repository unitOfWork resolveRef: 'refs/tags/testTag') notNil;
		shouldnt: [ repository unitOfWork tags ] raise: GitObjectNotFoundError;
		assert: repository unitOfWork tags size = 1.