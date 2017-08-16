patching
applyPatch: aPatch
	aPatch applyTo: self displayingProgress: 'Writing objects to files'.
	self shouldStoreMetadata
		ifTrue: [self generateTableOfContentsAfterApplying: aPatch in: directory].