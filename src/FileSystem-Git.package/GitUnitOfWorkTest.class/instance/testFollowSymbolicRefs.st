tests
testFollowSymbolicRefs
	| followed |	
	followed := self unitOfWork followSymbolicRefs: 'HEAD'.
	self assert: 'refs/heads/master' equals: followed.