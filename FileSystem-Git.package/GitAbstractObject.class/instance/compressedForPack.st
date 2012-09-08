storing
compressedForPack
	^ GitStream streamContents: [ :stream | self compressedForPackOn: stream ]