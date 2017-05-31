private storing
generateTableOfContentsFor: aSnapshot in: aDirectory
	| toc |
	toc := self class tableOfContentsClass new.
	aSnapshot artifactsDo: [:each |
		each wantsToBeInTableOfContents
			ifTrue: [ toc at: each path put: (each storeInfo at: #serializer) ]].
	self writeTableOfContents: toc into: aDirectory / self class tocFileName.