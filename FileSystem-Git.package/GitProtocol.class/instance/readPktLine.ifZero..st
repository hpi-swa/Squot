accessing
readPktLine: aStream ifZero: aBlock
	| totalLineLength |
	totalLineLength := self readLineLengthFrom: aStream.
	^ totalLineLength = 0
		ifTrue: aBlock 
		ifFalse: [ aStream next: totalLineLength - 4 ]