Pur store
restoreToSnapshot: aSnapshot
	"read objects from aSnapshot and update/replace files"
	self removeArtifactsOutdatedBy: aSnapshot.
	aSnapshot artifacts do: [:each | self store: each]
		displayingProgress: 'Writing objects to files'.
	self shouldStoreMetadata ifTrue: [self generateTableOfContentsFor: aSnapshot in: directory].