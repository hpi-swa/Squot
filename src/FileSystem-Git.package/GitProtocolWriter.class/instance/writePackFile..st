commands receive-pack
writePackFile: aPackFile
	aPackFile packDataStreamDo: [:packStream |
		self flag: 'TODO: care for server ofs-delta capability or its absence?'.
		[packStream atEnd]
			whileFalse: [self writeData: (packStream next: 65520 "max pkt-line payload, but actually arbitrary here")]]