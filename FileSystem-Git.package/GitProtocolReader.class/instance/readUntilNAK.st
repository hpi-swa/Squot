private receiving
readUntilNAK
	[ self peekForNAK
		ifTrue: [ true ]
		ifFalse: [ stream next. false ] ] whileFalse