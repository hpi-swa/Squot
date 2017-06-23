tests
testDeleteRef
	repository deleteRef: 'refs/heads/feature/x'.
	self deny: (repository headsDir resolve: 'feature/x') exists;
		deny: (repository packedRefs includesRef: 'refs/heads/feature/x')