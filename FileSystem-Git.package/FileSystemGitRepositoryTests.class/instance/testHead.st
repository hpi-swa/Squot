tests
testHead
	| head fsOnHead |
	head := basicRepository objectWithSignature: basicRepository headRef.
	fsOnHead := repository head.
	self assert: fsOnHead species = GitFilesystem.
	self assert: head = (fsOnHead  revision)