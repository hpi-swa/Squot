tests
testReferenceTo
	|path|
	path := FSPath / 'a' / 'b'.
	self assert: (filesystem referenceTo: '/') isRoot.
	self assert: (filesystem referenceTo: '/a/b') path = path.