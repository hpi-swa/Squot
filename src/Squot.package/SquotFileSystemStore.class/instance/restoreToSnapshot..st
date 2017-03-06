Pur store
restoreToSnapshot: aSnapshot
	"read objects from aSnapshot and update/replace files"
	self removeArtifactsOutdatedBy: aSnapshot.
	aSnapshot artifactsDo: [:each | self store: each].
	self generateTableOfContentsFor: aSnapshot in: directory.