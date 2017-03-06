tests
testBranches
	| branches |
	branches := repository branches.
	self assert: branches size = 2.
	branches do: [ :aBranch |
		self assert: aBranch species = GitFilesystem.
		self assert: ({ FSPath / 'blob1'. FSPath / 'blob2' } 
			includes: aBranch root children first path) ]