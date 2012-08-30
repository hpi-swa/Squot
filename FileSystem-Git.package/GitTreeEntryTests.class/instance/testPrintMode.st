class-tests
testPrintMode
	self assert: (GitTreeEntry printMode: GitTreeEntry fileMode) = '100644'.
	self assert: (GitTreeEntry printMode: GitTreeEntry dirMode) = '40000'