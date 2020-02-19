testing
testConfigValueAbsent
	self assert: (repository configAt: 'remote.origin.url' ifAbsent: [42]) = 42.