tests
testReadingLightTag
	GitLightweightTag named: 'testTag' for: repository head in: repository.
	
	self assert: (repository resolveRef: 'refs/tags/testTag') notNil;
		shouldnt: [ repository tags ] raise: GitObjectNotFoundError;
		assert: repository tags size = 1.