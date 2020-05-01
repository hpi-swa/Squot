tests
testMissingRefIsCached
	"Must not err due to storing into the caches and must not look up again. If the ref is later created, the cache must be updated."
	| unitOfWork head refStore reads |
	head := '1234567890123456789012345678901234567890'.
	unitOfWork := self unitOfWork.
	refStore := self installMockRefStore: unitOfWork.
	self assert: (unitOfWork resolveRef: 'master') isNil;
		assert: (unitOfWork resolveRef: 'master') isNil;
		assert: refStore reads asBag = (reads := #('master' 'refs/master' 'refs/tags/master' 'refs/heads/master' 'refs/remotes/master' "'refs/remotes/master/HEAD'")) asBag.
	self assert: unitOfWork headRef isNil;
		assert: unitOfWork headRef isNil;
		assert: refStore reads asBag = (reads := reads, #('HEAD' 'refs/HEAD' 'refs/tags/HEAD' 'refs/heads/HEAD' 'refs/remotes/HEAD' "'refs/remotes/HEAD/HEAD'")) asBag.
	unitOfWork updateRef: 'refs/heads/master' to: '1234567890123456789012345678901234567890'.
	self assert: (unitOfWork resolveRef: 'refs/heads/master') notNil;
		assert: (unitOfWork resolveRef: 'master') notNil;
		assert: unitOfWork headRef notNil;
		assert: refStore reads asBag = "previous"reads asBag.