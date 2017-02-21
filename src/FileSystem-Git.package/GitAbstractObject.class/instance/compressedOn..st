storing
compressedOn: aStream
	<todo: 'use commented code once memory filesystems return a stream that respects the binary setting'>
	"| zip |
	zip := ZLibWriteStream on: aStream.
	[ self byteSignatureOn: zip ]
		ensure: [ zip close ]"
	
	| zip |
	zip := ZLibWriteStream on: ByteArray new.
	[ zip nextPutAll: (GitStream streamContents: [ :stream | self byteSignatureOn: stream ]) ]
		ensure: [ zip close ].
		
	aStream nextPutAll: zip encodedStream contents