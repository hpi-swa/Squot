tests-index
testWrite8ByteOffsetTable
	| reference |
	self fail. "not enough memory..."
	self generateMoreThan2GHashes.
	reference := FileSystem disk workingDirectory / 'git_offset_test.tmp'.
	reference writeStreamDo: [ :stream | creator writeOffsetTableOfSize: 8 on: stream ].
	
	"smallest offset is always 12 because of 12 header bytes"	
	self assert: 12 equals: (reference readStream next: 8) asInteger