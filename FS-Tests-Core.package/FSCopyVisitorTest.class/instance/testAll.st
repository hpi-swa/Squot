tests
testAll
	self setUpGreek.
	FSCopyVisitor 
		copy: (source referenceTo: '/alpha') 
		to: (dest referenceTo: '/alpha').
	self assert: (dest isDirectory: '/alpha').
	self assert: (dest isFile: '/alpha/beta/gamma').