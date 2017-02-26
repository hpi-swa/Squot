tests
testAll
	self setUpGreek.
	FSCopyVisitor 
		copy: (source / 'alpha') 
		to: (dest / 'alpha').
	self assert: (dest isDirectory: '/alpha').
	self assert: (dest isFile: '/alpha/beta/gamma').