tests
testFollowSymbolicRefs
	| followed |	
	followed := repository followSymbolicRefs: 'HEAD'.
	self assert: 'refs/heads/master' equals: followed.