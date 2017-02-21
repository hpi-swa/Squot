tests-index
testWrite8ByteOffsetTable
	"NOTE: cannot reliably test this because I can't generate enough objects without 
	blowing the memory"
	| byteStream |
	byteStream := (ByteArray streamContents: [ :stream | 
		creator
			write4ByteIndexTableOn: stream;
			writeOffsetTableOfSize: 8 on: stream ]) readStream.
	
	self assert: byteStream contents size equals: (7 * 4) + (7 * 8).
	self assert: (byteStream next: 4) equals: #[128 0 0 0].
	self assert: (byteStream next: 4) equals: #[128 0 0 8].
	self assert: (byteStream next: 4) equals: #[128 0 0 16].
	self assert: (byteStream next: 4) equals: #[128 0 0 24].
	self assert: (byteStream next: 4) equals: #[128 0 0 32].
	self assert: (byteStream next: 4) equals: #[128 0 0 40].
	self assert: (byteStream next: 4) equals: #[128 0 0 48].
	
	"each of the objects has size 8 (see #setUp) but the compressed size varies"
	self assert: (byteStream next: 8) asInteger equals: 12