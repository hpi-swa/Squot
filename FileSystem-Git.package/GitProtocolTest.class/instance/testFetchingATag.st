tests
testFetchingATag
	| protocol tag |
	protocol := self newProtocol.
	tag := protocol tags anyOne.
	self halt.
	protocol want: tag