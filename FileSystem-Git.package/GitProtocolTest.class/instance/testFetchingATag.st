tests
testFetchingATag
	| protocol tag result |
	
	protocol := self newProtocol.
	tag := protocol tags anyOne.
	result := protocol want: tag.
	
	self deny: result isEmpty.