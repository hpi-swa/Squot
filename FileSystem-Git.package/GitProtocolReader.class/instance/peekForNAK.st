private receiving
peekForNAK
	^  (stream peek: 4) asByteArray = self class nakValue  "NAK\n"