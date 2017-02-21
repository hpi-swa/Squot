tests
testFetchingABranch
	| protocol branch result |
	
	protocol := self newProtocol.
	protocol withOpenConnection: [
		branch := protocol branches anyOne.
		result := protocol want: branch].

	self deny: result isEmpty.