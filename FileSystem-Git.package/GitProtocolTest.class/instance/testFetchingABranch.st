tests
testFetchingABranch
	|protocol branch|
	protocol := self newProtocol.
	branch := protocol branches anyOne.
	protocol want: branch