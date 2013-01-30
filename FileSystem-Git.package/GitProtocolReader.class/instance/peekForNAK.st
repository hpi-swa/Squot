initialize-release
peekForNAK
	^  (stream peek: 4) asByteArray = self class nakValue  "NAK\n"