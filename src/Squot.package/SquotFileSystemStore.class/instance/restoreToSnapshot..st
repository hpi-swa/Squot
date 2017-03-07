Pur store
restoreToSnapshot: aSnapshot
	"read objects from aSnapshot and update/replace files"
	self removeArtifactsOutdatedBy: aSnapshot.
	aSnapshot artifactsDo: [:each | self store: each].
	self shouldStoreMetadata ifTrue: [self generateTableOfContentsFor: aSnapshot in: directory].