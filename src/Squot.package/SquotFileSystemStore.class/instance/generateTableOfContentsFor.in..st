private storing
generateTableOfContentsFor: aSnapshot in: aDirectory
	| toc |
	toc := Dictionary new.
	aSnapshot artifactsDo: [:each |
		each wantsToBeInTableOfContents
			ifTrue: [ toc at: each path put: (each storeInfo at: #serializer) ]].
	directory / self class tocFileName writeStreamDo: [:stream |
		STON squotPut: toc onStream: stream].