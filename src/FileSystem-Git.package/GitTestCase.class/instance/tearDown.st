running
tearDown
	(self class allInstVarNames includes: 'repository') ifTrue:
		[self assertThatGitObjectsHaveCorrectRepository].
	super tearDown.