patching
applyPatch: aPatch
	aPatch applyDiffsTo: self displayingProgress: 'Writing objects to files'.
	self shouldStoreMetadata
		ifTrue: [self generateTableOfContentsAfterApplying: aPatch in: directory].