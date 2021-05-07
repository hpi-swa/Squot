tests
testBranches
	| branches |
	branches := self unitOfWork branches.
	self assert: branches size = 3.
	branches do: [ :each |
		self assert: (each class = GitCommit).
		self assert: (#('message1' 'message2') includes: each message) ]