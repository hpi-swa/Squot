Pur store
restoreToSnapshot: aSnapshot
	"read objects from aSnapshot and update/replace files"
	| toc |
	self removeArtifactsOutdatedBy: aSnapshot.
	self shouldStoreMetadata ifTrue:
		[toc := self tableOfContents.
		toc fileIn. "read the current file before new artifacts are written out"].
	aSnapshot artifacts do: [:each | self store: each]
		displayingProgress: 'Writing objects to files'.
	self shouldStoreMetadata ifTrue:
		[aSnapshot artifactsDo: [:each | toc add: each].
		toc fileOut].