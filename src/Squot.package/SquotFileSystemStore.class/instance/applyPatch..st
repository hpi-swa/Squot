patching
applyPatch: aPatch
	SquotToggles useNewApi ifTrue:
		[self applyMerge: aPatch.
		^ self snapshot].
	^ self openTableOfContentsDuring:
		[aPatch applyTo: self displayingProgress:
			[:each | 'Writing objects to files... ', each]]