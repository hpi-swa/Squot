private receiving
readUntilNAK
	| length |
	[ 
		length := self readLineLength.
		length = 0 ifTrue: [ ^ self ].
			
		self peekForNAK 
			ifTrue: [ ^ self resetFourByteLookahead ].
			
	true.] whileTrue.