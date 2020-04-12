tests
testDeleteRef
	self unitOfWork deleteRef: 'refs/heads/feature/x'.
	self assert: (self unitOfWork resolveRef: 'refs/heads/feature/x') isNil.