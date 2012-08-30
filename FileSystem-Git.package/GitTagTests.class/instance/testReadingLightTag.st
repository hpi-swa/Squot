tests
testReadingLightTag
	| tagFile |
	GitTag makeLightWeightTag: 'testTag' for: repository head in: repository.
	
	tagFile := repository tagsDir / 'testTag'.
	self assert: tagFile exists.
	self assert: tagFile readStream contents asString last = Character lf.
	self assert: tagFile readStream contents size = 41.
	self 
		shouldnt: [ repository tags ]
		raise: GitObjectNotFoundError.
	self assert: repository tags size = 1