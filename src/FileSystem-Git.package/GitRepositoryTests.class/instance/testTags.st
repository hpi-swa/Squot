tests
testTags
	| firstCommit tags |
	firstCommit := self unitOfWork head parents first.
	GitLightweightTag
		named: 'tag1'
		for: firstCommit
		in: repository.
	
	tags := self unitOfWork tags.
	self assert: tags size = 1.
	self assert: tags first name = 'tag1'.
	self assert: tags first object = firstCommit