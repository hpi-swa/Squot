printing
printStringWithoutPath
	^ String streamContents: [:stream | self printWithoutPathOn: stream]