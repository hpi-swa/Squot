tests
testInverseReferenceLookup
	| masterCommit |
	masterCommit := self unitOfWork objectReferenced: 'refs/heads/master'.
	self assert: 'refs/heads/master'
		equals: (self unitOfWork refTo: masterCommit).