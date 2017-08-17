private storing
addToTableOfContents: anArtifact
	| toc |
	anArtifact wantsToBeInTableOfContents ifFalse: [^ self].
	toc := self tableOfContents.
	self add: anArtifact toTableOfContents: toc.
	self writeTableOfContents: toc into: directory / self class tocFileName.