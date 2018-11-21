tests
testIsAvailable
	self assert: squitRepository isAvailable.
	gitRepository baseDir children do: #deleteAll.
	self deny: squitRepository isAvailable.