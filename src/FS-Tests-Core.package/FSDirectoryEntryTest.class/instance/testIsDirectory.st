tests
testIsDirectory
	| ref entry |
	ref := FSLocator imageDirectory resolve.
	entry := ref entry.
	self assert: entry isDirectory