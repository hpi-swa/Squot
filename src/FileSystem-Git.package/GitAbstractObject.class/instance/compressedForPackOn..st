storing
compressedForPackOn: aStream
	<todo: 'use commented code once memory filesystems return a stream that respects the binary setting'>
	"| zip |
	zip := ZLibWriteStream on: aStream.
	[ self byteDataOn: zip ]
		ensure: [ zip close ]"
	
	| zip |
	zip := ZLibWriteStream on: ByteArray new.
	[ self byteDataOn: zip ]
		ensure: [ zip close ].
		
	aStream nextPutAll: zip encodedStream contents