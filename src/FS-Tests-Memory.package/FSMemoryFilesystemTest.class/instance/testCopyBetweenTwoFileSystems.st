tests
testCopyBetweenTwoFileSystems
	| other bytes source target |
	other := self createFilesystem.
	source := (filesystem / 'foo') writeStream.
	[source nextPutAll: 'abcdef'] ensure: [source close].
	filesystem / 'foo' copyTo: other / 'foo'.
	target := (other / 'foo') readStream.
	bytes := [target upToEnd] ensure: [target close].
	self assert: 'abcdef' equals: bytes.