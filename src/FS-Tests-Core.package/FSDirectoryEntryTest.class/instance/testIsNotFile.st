tests
testIsNotFile
	| ref |
	ref := FSLocator imageDirectory resolve.
	self deny: ref entry isFile