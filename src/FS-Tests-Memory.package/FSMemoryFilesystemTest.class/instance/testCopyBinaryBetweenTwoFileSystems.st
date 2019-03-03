tests
testCopyBinaryBetweenTwoFileSystems
	| other bytes source target |
	other := self createFilesystem.
	source := (filesystem / 'foo') writeStream.
	[source binary; nextPutAll: #[16rFA 16rFB 16rFC 16rFD 16rFE 16rFD]]
		ensure: [source close].
	filesystem / 'foo' copyTo: other / 'foo'.
	target := (other / 'foo') readStream.
	bytes := [target binary; upToEnd] ensure: [target close].
	self assert: #[16rFA 16rFB 16rFC 16rFD 16rFE 16rFD] equals: bytes.