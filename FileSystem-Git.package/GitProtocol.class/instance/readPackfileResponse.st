accessing
readPackfileResponse 
"TODO:
find out, why SocketStream doesn't deliver all of the data or corrupts it (or who else does).
Careful: when using Transcript for debugging, the code might become so slow that you won't see any problems with receiving data..."
	
	self readUntilNAK.
	
	^ ByteArray streamContents: [ :packStream | 
		[ :job | [
			self 
				readSideBandResponseIfData: [ :data | packStream nextPutAll: data ]
				ifMessage: [ :message | job title: (message splitOn: Character lf) first asString ]
				ifError: [ :errorMessage | Error signal: errorMessage ]
				ifZero: [ ^ packStream contents ].
			self stream atEnd ] whileFalse
		] asJob run ].