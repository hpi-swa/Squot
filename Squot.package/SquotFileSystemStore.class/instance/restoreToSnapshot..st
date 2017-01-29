Pur store
restoreToSnapshot: aSnapshot
	"read objects from aSnapshot and update/replace files"
	self generateTableOfContentsFor: aSnapshot in: directory.
	aSnapshot artifactsDo: [:each | self store: each].