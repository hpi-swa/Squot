tests
testBranches
	| branches |
	branches := repository branches.
	self assert: branches size = 2.
	branches do: [ :each |
		self assert: (each class = GitCommit).
		self assert: (#('message1' 'message2') includes: each message) ]