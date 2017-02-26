tests
testWorkingDirPrintString
	| path actual |
	path := FSPath workingDirectory. 
	actual := path printString.
	self assert: actual = 'FSPath workingDirectory'