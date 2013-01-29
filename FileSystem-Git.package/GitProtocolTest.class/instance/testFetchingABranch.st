as yet unclassified
testFetchingABranch
	|protocol branch|
	protocol := self newProtocol.
	branch := protocol branches anyOne.
	protocol halt want: branch