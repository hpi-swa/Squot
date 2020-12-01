tests
testHead
	| head fsOnHead |
	head := self unitOfWork objectNamed: self unitOfWork headRef.
	fsOnHead := repository head.
	self assert: fsOnHead species = GitFilesystem.
	self assert: head = (fsOnHead  revision)