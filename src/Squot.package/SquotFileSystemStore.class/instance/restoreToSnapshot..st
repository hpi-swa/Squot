Pur store
restoreToSnapshot: aSnapshot
	"read objects from aSnapshot and update/replace files"
	| toc newSnapshot |
	self removeArtifactsOutdatedBy: aSnapshot.
	newSnapshot := SquotSnapshot builder.
	SquotProgress display: 'Writing objects to files'
		for: aSnapshot artifacts do: [:each | newSnapshot add: (self store: each)].
	self shouldStoreMetadata ifTrue:
		[toc := self tableOfContents.
		toc removeAll.
		aSnapshot artifactsInLoadOrderDo: [:each | toc add: each].
		toc fileOut].
	newSnapshot loadOrder: aSnapshot loadOrder.
	^ newSnapshot