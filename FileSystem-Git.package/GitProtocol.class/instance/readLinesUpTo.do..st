private
readLinesUpTo: terminator do: aBlock
	
	|  lineBuffer totalLineLength|
	
	" read input until we get the terminating line"
	[true] whileTrue: [
		totalLineLength := Integer readFrom: (self stream next: 4) base: 16.
		totalLineLength = 0 ifTrue: [ ^ self ].
		
		lineBuffer := self stream next: totalLineLength - 4.
		lineBuffer = terminator ifTrue: [ ^ self ].
			
		aBlock value: lineBuffer]