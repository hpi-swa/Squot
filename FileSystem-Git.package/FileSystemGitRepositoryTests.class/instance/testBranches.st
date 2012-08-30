tests
testBranches
	| branches |
	branches := repository branches.
	self assert: branches size = 2.
	branches do: [ :aBranch |
		self assert: aBranch species = GitFilesystem.
		self assert: ({ Path / 'first blob'. Path / 'second blob' } 
			includes: aBranch root children first path) ]