tests-index
testWriteCRCTableOn
	| bytes |
	bytes := ByteArray streamContents: [ :stream | creator writeCRCTableOn: stream ].
	self assert: 4 * 7 equals: bytes size