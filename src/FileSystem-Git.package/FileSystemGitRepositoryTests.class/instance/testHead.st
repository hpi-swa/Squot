tests
testHead
	| head fsOnHead |
	head := basicRepository objectNamed: basicRepository headCommitName.
	fsOnHead := repository head.
	self assert: fsOnHead species = GitFilesystem.
	self assert: head = (fsOnHead  revision)