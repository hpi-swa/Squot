private
readPktLine: aStream ifZero: aBlock
	| totalLineLength |
	totalLineLength := Integer readFrom: (aStream next: 4) base: 16.
	^ totalLineLength = 0
		ifTrue: aBlock 
		ifFalse: [ aStream next: totalLineLength - 4 ]