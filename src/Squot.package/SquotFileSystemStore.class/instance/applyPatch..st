patching
applyPatch: aPatch
	aPatch diffs do: [:each | self applyDiff: each]
		displayingProgress: 'Writing objects to files'.
	self shouldStoreMetadata
		ifTrue: [self generateTableOfContentsAfterApplying: aPatch in: directory].