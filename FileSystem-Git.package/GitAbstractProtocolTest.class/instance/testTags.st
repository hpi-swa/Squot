tests
testTags
	| protocol tags |
	protocol := self newProtocol.
	tags := protocol tags.
	self deny: tags isEmpty.