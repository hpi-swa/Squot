tests
testRootPrintString
	| path actual |
	path := FSPath root.
	actual := path printString.
	self assert: actual = 'FSPath root'