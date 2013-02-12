private receiving
peekForNAK
	^  self fourByteLookahead = #[78 65 75 10]  "NAK\n"