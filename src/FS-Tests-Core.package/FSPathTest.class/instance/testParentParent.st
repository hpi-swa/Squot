tests
testParentParent
	| path  |
	path := (FSPath * '..') parent.
	self assert: path size = 2.
	self assert: (path at: 1) = '..'.
	self assert: (path at: 2) = '..'.