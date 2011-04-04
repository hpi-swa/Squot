tests
testBeta
	self setUpGreek.
	FSDeleteVisitor delete: (filesystem referenceTo: '/alpha/beta').
	self assert: (filesystem isDirectory: '/alpha').
	self assert: (filesystem isDirectory: '/alpha/epsilon').
	self deny: (filesystem exists: '/alpha/beta').
	