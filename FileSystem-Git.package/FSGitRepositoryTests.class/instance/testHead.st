tests
testHead
	| head fsOnHead |
	head := basicRepository objectWithSignature: basicRepository headRef.
	fsOnHead := repository head.
	self assert: fsOnHead species = FSGitFilesystem.
	self assert: head = (fsOnHead  revision)