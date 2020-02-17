tests
testDeleteRef
	repository deleteRef: 'refs/heads/feature/x'.
	self assert: (repository resolveRef: 'refs/heads/feature/x') isNil.