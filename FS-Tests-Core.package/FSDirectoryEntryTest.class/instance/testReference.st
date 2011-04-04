tests
testReference
	| ref entry |
	ref := FSLocator image resolve.
	entry := ref entry.
	self assert: entry reference = ref