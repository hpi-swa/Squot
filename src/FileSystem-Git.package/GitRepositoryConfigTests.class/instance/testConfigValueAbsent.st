tests
testConfigValueAbsent
	self assert: (self unitOfWork configAt: 'remote.origin.url' ifAbsent: [42]) = 42.