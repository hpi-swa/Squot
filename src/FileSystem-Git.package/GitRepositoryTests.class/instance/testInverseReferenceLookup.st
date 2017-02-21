tests
testInverseReferenceLookup
	| masterCommit |
	masterCommit := repository objectReferenced: 'refs/heads/master'.
	self assert: 'refs/heads/master'
		equals: (repository refTo: masterCommit).