tests
testRootParent
	| root |
	root := filesystem referenceTo: FSPath root.
	self assert: root parent == root