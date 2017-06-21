tests
testIsAvailable
	self assert: squitRepository isAvailable.
	gitRepository repository baseDir children do: #deleteAll.
	self deny: squitRepository isAvailable.