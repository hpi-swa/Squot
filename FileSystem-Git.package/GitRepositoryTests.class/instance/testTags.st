tests
testTags
	| firstCommit tags |
	firstCommit := repository head parents first.
	GitTag
		makeLightWeightTag: 'tag1'
		for: firstCommit
		in: repository.
	
	tags := repository tags.
	self assert: tags size = 1.
	self assert: tags first name = 'tag1'.
	self assert: tags first object = firstCommit