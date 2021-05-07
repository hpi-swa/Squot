patching
applyPatch: aPatch
	^ self openTableOfContentsDuring:
		[aPatch applyTo: self displayingProgress:
			[:each | 'Writing objects to files... ', each]]