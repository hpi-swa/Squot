tests
testRootParent
	| root |
	root := FSPath root.
	self assert: root parent == root