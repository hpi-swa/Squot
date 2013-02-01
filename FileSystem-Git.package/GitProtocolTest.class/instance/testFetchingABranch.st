tests
testFetchingABranch
	| protocol branch result |
	
	protocol := self newProtocol.
	branch := protocol branches anyOne.
	result := protocol want: branch.

	self deny: result isEmpty.