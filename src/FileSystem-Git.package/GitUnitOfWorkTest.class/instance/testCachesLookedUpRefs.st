tests
testCachesLookedUpRefs
	| unitOfWork head refStore |
	head := '1234567890123456789012345678901234567890'.
	unitOfWork := self unitOfWork.
	refStore := self installMockRefStore: unitOfWork.
	refStore at: 'refs/heads/master' put: head.
	self assert: (unitOfWork resolveRef: 'refs/heads/master') = head;
		assert: (unitOfWork resolveRef: 'refs/heads/master') = head;
		assert: refStore reads size = 1. "read refs/heads/master"
	self assert: unitOfWork headRef = head;
		assert: unitOfWork headRef = head;
		assert: refStore reads size = 2. "+ read HEAD"
	self assert: (unitOfWork resolveRef: 'master') = head;
		assert: (unitOfWork resolveRef: 'master') = head;
		assert: refStore reads size = 5. "+ read master, refs/master, refs/tags/master, (refs/heads/master)"