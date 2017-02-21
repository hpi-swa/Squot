tests
testReadStream
	| zipped complex complexReader zipReader zipper afterZipped |
	zipper := ZLibWriteStream on:  ByteArray new.
	zipper nextPutAll: 'foo bar' asByteArray.
	zipper close.
	zipped := zipper encodedStream contents.
	
	complex := 'before' asByteArray, zipped, 'baz' asByteArray.
	complexReader := complex readStream.
	self assert: (complexReader next: 6) asString equals: 'before'.
	self assert: complexReader position equals: 6.
	
	zipReader := GitZLibReadStream on: complexReader.
	self assert: zipReader contents asString equals: 'foo bar'.
	afterZipped := complexReader size - ('baz' size).
	self assert: complexReader position equals: afterZipped.
	self assert: complexReader upToEnd asString equals: 'baz'
	