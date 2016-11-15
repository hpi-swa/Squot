private receiving
peekForNAK
	^  self fourByteLookahead asByteArray = #[78 65 75 10]  "NAK\n"