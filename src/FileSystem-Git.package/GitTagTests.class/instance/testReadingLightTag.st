tests
testReadingLightTag
	| tagFile |
	GitLightweightTag named: 'testTag' for: self unitOfWork head in: repository.
	
	tagFile := repository tagsDir / 'testTag'.
	self assert: tagFile exists.
	self assert: tagFile readStream contents asString last = Character lf.
	self assert: tagFile readStream contents size = 41.
	self assert: (self unitOfWork resolveRef: 'refs/tags/testTag') notNil;
		shouldnt: [ self unitOfWork tags ] raise: GitObjectNotFoundError;
		assert: self unitOfWork tags size = 1.