tests
testSourceStreamPositionAfterReadingLargeCompressedObject
	| zipped encodedStream endlessStream zlibBufferSize counter complex complexReader zipReader zipper afterZipped |
	"create a compressed stream that is longer than the buffer of the InflateStream implementation"
	zipper := ZLibWriteStream on: ByteArray new.
	zipper nextPutAll: '0'; close.
	encodedStream := zipper encodedStream contents readStream.
	endlessStream := EndlessStream on: encodedStream.
	zlibBufferSize := (GitZLibReadStream on: endlessStream) sourceLimit.
	zipper := ZLibWriteStream on:  ByteArray new.
	counter := 0.
	[zipper encodedStream size < zlibBufferSize] whileTrue:
		[zipper nextPutAll: counter printString asByteArray.
		counter := counter + 1].
	zipper close.
	zipped := zipper encodedStream contents.
	
	complex := 'before' asByteArray, zipped, 'baz' asByteArray.
	complexReader := complex readStream.
	self assert: (complexReader next: 6) asString equals: 'before'.
	self assert: complexReader position equals: 6.
	
	zipReader := GitZLibReadStream on: complexReader.
	zipReader contents.
	afterZipped := complexReader size - ('baz' size).
	self assert: afterZipped equals: complexReader position.
	self assert: 'baz' equals: complexReader upToEnd asString.
	