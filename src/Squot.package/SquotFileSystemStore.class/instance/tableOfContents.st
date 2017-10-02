private metadata access
tableOfContents
	^ tableOfContentsDuringTransaction ifNil:
		[SquotTableOfContentsFile on: self tableOfContentsReference]