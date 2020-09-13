Pur store
restoreToSnapshot: aSnapshot
	"read objects from aSnapshot and update/replace files"
	| toc |
	self removeArtifactsOutdatedBy: aSnapshot.
	SquotProgress display: 'Writing objects to files'
		for: aSnapshot artifacts do: [:each | self store: each].
	self shouldStoreMetadata ifTrue:
		[toc := self tableOfContents.
		toc removeAll.
		aSnapshot artifactsInLoadOrderDo: [:each | toc add: each].
		toc fileOut].