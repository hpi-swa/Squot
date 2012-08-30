private
readLinesUpTo: terminator do: aBlock
	
	|  lineBuffer totalLineLength|
	
	" read input until we get the terminating line"
	[true] whileTrue: [
		totalLineLength := Integer readFrom: (self socketStream next: 4) base: 16.
		totalLineLength = 0 ifTrue: [ ^ self ].
		
		lineBuffer := self socketStream next: totalLineLength - 4.
		lineBuffer = terminator ifTrue: [ ^ self ].
			
		aBlock value: lineBuffer]