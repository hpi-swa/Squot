tests
testBaseDir
	self assert: (reference basename endsWith: '.git').
	self assert: repository baseDir = reference.
	
	reference := reference resolve: 'noExtension'.
	repository := GitRepository on: reference.
	self deny: repository baseDir = reference.
	self assert: repository baseDir = (reference resolve: '.git')