tests
testDeleteRef
	self unitOfWork deleteRef: 'refs/heads/feature/x'.
	self deny: (repository headsDir resolve: 'feature/x') exists;
		deny: ((GitPackedRefStore on: repository) includes: 'refs/heads/feature/x')