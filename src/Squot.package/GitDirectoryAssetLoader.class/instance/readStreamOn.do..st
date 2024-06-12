accessing
readStreamOn: aPath do: aBlock
	^ (self directory resolve: (aPath relativeTo: FSPath root)) readStreamDo: aBlock