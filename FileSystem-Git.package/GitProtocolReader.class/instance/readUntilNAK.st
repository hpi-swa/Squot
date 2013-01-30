initialize-release
readUntilNAK
	| length |
	[ 
		length := self readLineLength.
		length = 0 ifTrue: [ ^ self ].
			
		(self peekForNAK)
			ifTrue: [ ^ self consumeNAK ].
			
	true] whileTrue.