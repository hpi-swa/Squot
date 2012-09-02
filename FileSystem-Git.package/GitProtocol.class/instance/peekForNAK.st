private
peekForNAK
	^  (self socketStream peek: 4) asByteArray = #[78 65 75 10]  "NAK\n"