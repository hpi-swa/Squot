printing
printDescriptionStringWithoutPath
	^ String streamContents: [:stream | self printDescriptionWithoutPathOn: stream]