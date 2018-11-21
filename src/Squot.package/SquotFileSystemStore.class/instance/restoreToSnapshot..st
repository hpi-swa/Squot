Pur store
restoreToSnapshot: aSnapshot
	"read objects from aSnapshot and update/replace files"
	| toc |
	self removeArtifactsOutdatedBy: aSnapshot.
	aSnapshot artifacts do: [:each | self store: each]
		displayingProgress: 'Writing objects to files'.
	self shouldStoreMetadata ifTrue:
		[toc := self tableOfContents.
		toc removeAll.
		aSnapshot artifactsInLoadOrderDo: [:each | toc add: each].
		toc fileOut].