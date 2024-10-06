accessing
readStreamOn: aPath do: aBlock
	^ (SquotPathUtilities resolve: aPath withRootAt: self directory) readStreamDo: aBlock