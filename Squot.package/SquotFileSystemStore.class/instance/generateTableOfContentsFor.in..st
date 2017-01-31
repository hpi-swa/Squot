private snapshot building
generateTableOfContentsFor: aSnapshot in: aDirectory
	| toc |
	toc := Dictionary new.
	aSnapshot artifactsDo: [:each |
		each wantsToBeInTableOfContents
			ifTrue: [ toc at: each path put: (each storeInfo at: #serializer) ]].
	directory / '.squot-table-of-contents' writeStreamDo: [:stream |
		STON put: toc onStreamPretty: stream].