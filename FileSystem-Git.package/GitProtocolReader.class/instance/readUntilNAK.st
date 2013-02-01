private receiving
readUntilNAK
	[ self readLineLength = 0
		ifTrue: [ ^ self ].
	  self peekForNAK ] whileFalse