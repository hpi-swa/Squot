private receiving
peekForNAK
	"If next bytes are 'NAK\n' return true and advance the stream. Otherwise, return false and don't change the stream."
	 | nak |
	nak := self class nakValue.
	^ ((stream peek: nak size) asByteArray = nak)
			ifTrue: [ stream next: nak size. true ]
			ifFalse: [ false ]