private receiving
readPackfileResponse
"TODO:
find out, why SocketStream doesn't deliver all of the data or corrupts it (or who else does).
Careful: when using Transcript for debugging, the code might become so slow that you won't see any problems with receiving data..."
	
	self readUntilNAK.
	
	^ ByteArray streamContents: [ :packStream | 
		'' displayProgressFrom: 0 to: 1 during: [:progress | [ self 
				readSideBandResponseIfData: [ :data | packStream nextPutAll: data ]
				ifMessage: [ :message | progress value: (message splitBy: String lf asByteArray) first asString ]
				ifError: [ :errorMessage | Error signal: errorMessage ]
				ifZero: [ ^ packStream contents ].
			stream atEnd ] whileFalse ] ].