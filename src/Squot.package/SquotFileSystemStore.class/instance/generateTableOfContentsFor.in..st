private storing
generateTableOfContentsFor: aSnapshot in: aDirectory
	| toc |
	toc := self class tableOfContentsClass new.
	aSnapshot artifactsDo: [:each |
		each wantsToBeInTableOfContents
			ifTrue: [self add: each toTableOfContents: toc]].
	self writeTableOfContents: toc into: aDirectory / self class tocFileName.